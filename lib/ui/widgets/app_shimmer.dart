import 'package:flutter/material.dart';
import 'package:rtsp_preview/ui/constants/app_color.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double? radius;
  final double height;
  final double width;

  const AppShimmer({
    super.key,
    this.radius,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.silver.withOpacity(0.4),
      highlightColor: AppColor.lightGrey.withOpacity(0.3),
      period: const Duration(
        seconds: 1,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.silver,
          borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        ),
      ),
    );
  }
}
