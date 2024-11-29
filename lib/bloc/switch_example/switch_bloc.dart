import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/switch_example/switch_events.dart';
import 'package:bloc_tutorial_app/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: event.sliderValue));
  }
}
