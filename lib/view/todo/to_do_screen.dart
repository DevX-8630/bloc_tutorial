import 'package:bloc_tutorial_app/bloc/todo/to_do_bloc.dart';
import 'package:bloc_tutorial_app/bloc/todo/to_do_event.dart';
import 'package:bloc_tutorial_app/bloc/todo/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (BuildContext context, state) => state.todosList.isEmpty
            ? const Center(
                child: Text(
                  'No Data Found',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todosList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ToDoBloc>().add(RemoveToDoEvent(index: index));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
                itemCount: state.todosList.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
