import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.g.dart';
part 'person_model.freezed.dart';

@Freezed()
class PersonModel with _$PersonModel {
  factory PersonModel({
    @Default('NA') String? name,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, Object?> json) => _$PersonModelFromJson(json);
}
