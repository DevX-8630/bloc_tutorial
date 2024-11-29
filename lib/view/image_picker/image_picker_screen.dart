import 'dart:io';

import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(
                  child: Icon(
                    Icons.camera,
                    size: 50,
                  ),
                ),
              );
            } else {

              return Image.file(
                File(
                  state.file!.path.toString(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
