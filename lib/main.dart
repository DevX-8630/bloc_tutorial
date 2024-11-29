import 'package:bloc_tutorial_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial_app/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_tutorial_app/utils/image_picker_utils.dart';
import 'package:bloc_tutorial_app/view/image_picker/image_picker_screen.dart';
import 'package:bloc_tutorial_app/view/switch_example/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
