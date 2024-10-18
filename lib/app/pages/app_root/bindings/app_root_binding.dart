import 'package:get/get.dart';
import '/app/pages/app_root/controllers/app_root_controller.dart';

class AppRootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppRootController>(
      () => AppRootController(),
      fenix: true,
    );
  }
}
  