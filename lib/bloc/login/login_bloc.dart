import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/utils/enums.dart';
import 'package:http/http.dart' as http;

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    //bug fixed
    /* on<LoginEvent>((event, emit) {
      on<EmailChanged>(_onEmailChanged);
      on<PasswordChanged>(_onPasswordChanged);
      on<LoginApi>(_loginApi);
    }); */
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'), body: data);

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(loginStatus: LoginStatus.success, message: 'Login Successful.'));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.error, message: responseData["error"]));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, message: e.toString()));
    }
  }
}
