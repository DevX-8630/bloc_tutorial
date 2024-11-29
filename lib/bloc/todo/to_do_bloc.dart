import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial_app/bloc/todo/to_do_event.dart';
import 'package:bloc_tutorial_app/bloc/todo/to_do_state.dart';
import 'package:flutter/cupertino.dart';

class ToDoBloc extends Bloc<ToDoEvents, ToDoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDoEvents);
    on<RemoveToDoEvent>(_removeToDoEvents);
  }

  void _addToDoEvents(AddToDoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todosList: List.from(todoList)));
  }

  void _removeToDoEvents(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    todoList.removeAt(event.index);
    emit(state.copyWith(todosList: todoList));
    // emit(state.copyWith(todosList: List.from(todoList)));
    debugPrint('length ------${state.todosList.length}');
    debugPrint('List ------${state.todosList}');

  }
}
