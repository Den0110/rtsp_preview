import 'package:injectable/injectable.dart';
import 'package:rtsp_preview/domain/entities/camera.dart';
import 'package:rtsp_preview/domain/repository/camera_repository.dart';

@Singleton(as: CameraRepository)
class CameraRepositoryImpl extends CameraRepository {

  /// Emulates network request with latency 1 second
  @override
  Future<List<Camera>> fetchCameras() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return [
          Camera(
            url: 'rtsp://178.141.80.235:55554/Esd93HFV_s/',
            name: 'Камера 1',
            description: 'rtsp://178.141.80.235:55554/Esd93HFV_s/',
          ),
          Camera(
            url: 'rtsp://178.141.80.235:55555/md5IffuT_s/',
            name: 'Камера 2',
            description: 'rtsp://178.141.80.235:55555/md5IffuT_s/',
          ),
        ];
      },
    );
  }
}
