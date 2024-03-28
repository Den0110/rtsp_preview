import 'package:rtsp_preview/domain/entities/camera.dart';

abstract class CameraRepository {
  Future<List<Camera>> fetchCameras();
}
