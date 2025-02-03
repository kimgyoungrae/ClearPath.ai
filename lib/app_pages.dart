import 'app_routes.dart';
import 'home_page.dart';
import 'package:get/route_manager.dart';
import 'detection_page.dart';
import 'detection_binding.dart';
import 'stream_detection_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      binding: DetectionBinding(),
      name: AppRoutes.detectionPage,
      page: () => const DetectPicture(),
    ),
    GetPage(
      binding: DetectionBinding(),
      name: AppRoutes.streamPage, 
      page: () => const StreamDetectionPage(),
    ),
  ];
}