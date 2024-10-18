import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();

    await 2.delay();
    Get.offNamed(
      Routes.login,
    );
  }
}
