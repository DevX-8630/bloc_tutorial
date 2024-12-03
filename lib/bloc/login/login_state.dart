part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.loginStatus = LoginStatus.intial,
    this.message = '',
  });

  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? loginStatus,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, password, loginStatus, message];
}
