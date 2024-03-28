import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:rtsp_preview/domain/entities/camera.dart';
import 'package:rtsp_preview/ui/constants/app_color.dart';
import 'package:rtsp_preview/ui/widgets/app_shimmer.dart';

class CameraItem extends StatefulWidget {
  final Camera camera;
  final VoidCallback onPressed;

  const CameraItem({
    super.key,
    required this.camera,
    required this.onPressed,
  });

  @override
  State<CameraItem> createState() => _CameraItemState();
}

class _CameraItemState extends State<CameraItem> {
  static const _videoRatio = 5 / 4;
  static const _revealAnimDuration = Duration(milliseconds: 1000);
  static const _videoLoadLagDuration = Duration(milliseconds: 1000);

  double get _previewSize => 100.r;
  late final VlcPlayerController _vlcViewController;

  bool isPreviewLoaded = false;

  @override
  void initState() {
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      widget.camera.url,
      autoPlay: true,
    );
    _vlcViewController.addOnInitListener(() {
      Future.delayed(_videoLoadLagDuration, () {
        setState(() {
          isPreviewLoaded = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 8.w),
            Stack(
              children: [
                AnimatedOpacity(
                  opacity: isPreviewLoaded ? 1.0 : 0.0,
                  duration: _revealAnimDuration,
                  child: Container(
                    width: _previewSize,
                    height: _previewSize,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRect(
                      child: OverflowBox(
                        maxWidth: _previewSize * _videoRatio,
                        maxHeight: _previewSize,
                        child: VlcPlayer(
                          controller: _vlcViewController,
                          aspectRatio: _videoRatio,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: isPreviewLoaded ? 0.0 : 1.0,
                  duration: _revealAnimDuration,
                  child: AppShimmer(
                    height: _previewSize,
                    width: _previewSize,
                    radius: 16.r,
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.camera.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.camera.description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }
}
