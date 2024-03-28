part of 'camera_list_bloc.dart';

@freezed
class CameraListState with _$CameraListState {
  const factory CameraListState.loading() = _Loading;

  const factory CameraListState.loaded({
    required List<Camera> cameras,
  }) = _Loaded;
}
