import 'package:equatable/equatable.dart';

abstract class ToDoEvents extends Equatable {
  const ToDoEvents();
  @override
  List<Object?> get props => [];
}

class AddToDoEvent extends ToDoEvents {
  final String task;

  const AddToDoEvent({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class RemoveToDoEvent extends ToDoEvents {
  final int index;
  const RemoveToDoEvent({
    required this.index,
  });
  @override
  List<Object?> get props => [];
}
