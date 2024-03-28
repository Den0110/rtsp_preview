import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtsp_preview/domain/entities/camera.dart';
import 'package:rtsp_preview/domain/repository/camera_repository.dart';

part 'camera_list_event.dart';

part 'camera_list_state.dart';

part 'camera_list_bloc.freezed.dart';

@injectable
class CameraListBloc extends Bloc<CameraListEvent, CameraListState> {
  final CameraRepository _cameraRepository;

  CameraListBloc(this._cameraRepository)
      : super(const CameraListState.loading()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    emit(const CameraListState.loading());
    final cameras = await _cameraRepository.fetchCameras();
    emit(CameraListState.loaded(cameras: cameras));
  }
}
