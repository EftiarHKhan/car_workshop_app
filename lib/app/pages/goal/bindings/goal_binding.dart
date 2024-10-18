import 'package:get/get.dart';
import '/app/pages/goal/controllers/goal_controller.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalController>(
      () => GoalController(),
      fenix: true,
    );
  }
}
  