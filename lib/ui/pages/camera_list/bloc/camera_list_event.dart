part of 'camera_list_bloc.dart';

@freezed
class CameraListEvent with _$CameraListEvent {
  const factory CameraListEvent.started() = _Started;
}
