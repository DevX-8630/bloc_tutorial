import 'package:bloc_tutorial_app/bloc/favourite/favourite_app_bloc.dart';
import 'package:bloc_tutorial_app/repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/todo/to_do_bloc.dart';
import 'package:bloc_tutorial_app/utils/image_picker_utils.dart';
import 'package:bloc_tutorial_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial_app/view/favourite_app/favourite_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FavouriteAppScreen(),
      ),
    );
  }
}
