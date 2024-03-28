import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:rtsp_preview/domain/entities/camera.dart';

@RoutePage()
class CameraFullScreenPage extends StatefulWidget {
  final Camera camera;

  const CameraFullScreenPage({
    super.key,
    required this.camera,
  });

  @override
  State<CameraFullScreenPage> createState() => _CameraFullScreenPageState();
}

class _CameraFullScreenPageState extends State<CameraFullScreenPage> {
  static const _videoRatio = 5 / 4;
  late final VlcPlayerController _vlcViewController;

  bool isPreviewLoaded = false;

  @override
  void initState() {
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      widget.camera.url,
      autoPlay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: VlcPlayer(
            controller: _vlcViewController,
            aspectRatio: _videoRatio,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        SafeArea(
          child: SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(0.1),
              title: Text(
                widget.camera.name,
                style: const TextStyle(color: Colors.white),
              ),
              leading: const BackButton(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }
}
