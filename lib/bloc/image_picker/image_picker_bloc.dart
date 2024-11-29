import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_tutorial_app/bloc/image_picker/image_picker_states.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils): super(const ImagePickerState()){
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryCapture);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageUsingCamera();
    emit(state.copyWith(file: file));
  }

  void _galleryCapture(GalleryCapture event, Emitter<ImagePickerState> emit){}
}