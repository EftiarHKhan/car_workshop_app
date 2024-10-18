import '/app/pages/activity/controllers/activity_controller.dart';
import '/app/pages/app_root/controllers/app_root_controller.dart';
import '/app/pages/goal/controllers/goal_controller.dart';
import '/app/pages/home/controllers/home_controller.dart';
import '/app/pages/profile/controllers/profile_controller.dart';
import '/app/pages/statistics/controllers/statistics_controller.dart';
import 'package:get/get.dart';

import '/app/pages/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      SplashController.new,
      fenix: true,
    );
    Get.lazyPut<AppRootController>(
      AppRootController.new,
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      HomeController.new,
      fenix: true,
    );
    Get.lazyPut<ActivityController>(
      ActivityController.new,
      fenix: true,
    );
    Get.lazyPut<StatisticsController>(
      StatisticsController.new,
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
      ProfileController.new,
      fenix: true,
    );
    Get.lazyPut<GoalController>(
      GoalController.new,
      fenix: true,
    );
  }
}
