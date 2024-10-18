import 'package:get/get.dart';

import '/app/pages/splash/bindings/splash_binding.dart';
import '/app/pages/splash/views/splash_view.dart';

import '/app/pages/app_root/bindings/app_root_binding.dart';
import '/app/pages/app_root/views/app_root_view.dart';
import '/app/pages/home/bindings/home_binding.dart';
import '/app/pages/home/views/home_view.dart';
import '/app/pages/activity/bindings/activity_binding.dart';
import '/app/pages/activity/views/activity_view.dart';
import '/app/pages/statistics/bindings/statistics_binding.dart';
import '/app/pages/statistics/views/statistics_view.dart';
import '/app/pages/profile/bindings/profile_binding.dart';
import '/app/pages/profile/views/profile_view.dart';
import '/app/pages/goal/bindings/goal_binding.dart';
import '/app/pages/goal/views/goal_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: SplashView.new,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.appRoot,
      page: () => AppRootView(),
      binding: AppRootBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.activity,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: Routes.statistics,
      page: () => StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.goal,
      page: () => GoalView(),
      binding: GoalBinding(),
    ),
  ];
}
