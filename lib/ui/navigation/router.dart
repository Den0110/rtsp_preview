import 'package:auto_route/auto_route.dart';
import 'package:rtsp_preview/ui/navigation/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CameraListRoute.page,
          initial: true,
        ),
        AutoRoute(page: CameraFullScreenRoute.page),
      ];
}
