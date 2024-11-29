import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

// ignore: must_be_immutable
class SliderEvent extends SwitchEvents {
  double sliderValue;
  SliderEvent({
    required this.sliderValue,
  });
  @override
  List<Object?> get props => [sliderValue];
}
