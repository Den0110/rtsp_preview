import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera.freezed.dart';

@freezed
class Camera with _$Camera {
  factory Camera({
    required String url,
    required String name,
    required String description,
  }) = _Camera;
}
