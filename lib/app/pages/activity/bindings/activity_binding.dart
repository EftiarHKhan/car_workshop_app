import 'package:get/get.dart';
import '/app/pages/activity/controllers/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(
      () => ActivityController(),
      fenix: true,
    );
  }
}
  