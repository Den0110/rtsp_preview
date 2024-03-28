import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtsp_preview/di/locator.dart';
import 'package:rtsp_preview/ui/navigation/router.gr.dart';
import 'package:rtsp_preview/ui/pages/camera_list/bloc/camera_list_bloc.dart';
import 'package:rtsp_preview/ui/pages/camera_list/widgets/camera_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtsp_preview/ui/widgets/app_shimmer.dart';

@RoutePage()
class CameraListPage extends StatelessWidget {
  const CameraListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraListBloc>(
      create: (context) =>
          getIt<CameraListBloc>()..add(const CameraListEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cameras'),
        ),
        body: BlocBuilder<CameraListBloc, CameraListState>(
          builder: (context, state) {
            return state.when(
              loading: () {
                return Column(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 8.w,
                      ),
                      child: AppShimmer(
                        height: 100.r,
                        width: double.infinity,
                        radius: 16.r,
                      ),
                    ),
                  ),
                );
              },
              loaded: (cameras) {
                return ListView.builder(
                  itemCount: cameras.length,
                  itemBuilder: (context, index) {
                    return CameraItem(
                      camera: cameras[index],
                      onPressed: () {
                        context.router.navigate(
                          CameraFullScreenRoute(camera: cameras[index]),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
