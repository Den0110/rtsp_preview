// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:rtsp_preview/domain/entities/camera.dart' as _i5;
import 'package:rtsp_preview/ui/pages/camera_fullscreen/camera_fullscreen_page.dart'
    as _i1;
import 'package:rtsp_preview/ui/pages/camera_list/camera_list_page.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CameraFullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CameraFullScreenRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CameraFullScreenPage(
          key: args.key,
          camera: args.camera,
        ),
      );
    },
    CameraListRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CameraListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CameraFullScreenPage]
class CameraFullScreenRoute
    extends _i3.PageRouteInfo<CameraFullScreenRouteArgs> {
  CameraFullScreenRoute({
    _i4.Key? key,
    required _i5.Camera camera,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CameraFullScreenRoute.name,
          args: CameraFullScreenRouteArgs(
            key: key,
            camera: camera,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraFullScreenRoute';

  static const _i3.PageInfo<CameraFullScreenRouteArgs> page =
      _i3.PageInfo<CameraFullScreenRouteArgs>(name);
}

class CameraFullScreenRouteArgs {
  const CameraFullScreenRouteArgs({
    this.key,
    required this.camera,
  });

  final _i4.Key? key;

  final _i5.Camera camera;

  @override
  String toString() {
    return 'CameraFullScreenRouteArgs{key: $key, camera: $camera}';
  }
}

/// generated route for
/// [_i2.CameraListPage]
class CameraListRoute extends _i3.PageRouteInfo<void> {
  const CameraListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CameraListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraListRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
