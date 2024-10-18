import 'package:car_workshop_app/app/pages/bookings_list/controllers/bookings_list_controller.dart';
import 'package:car_workshop_app/app/pages/intro/login/controllers/login_controller.dart';
import 'package:car_workshop_app/app/pages/intro/registration/controllers/registration_controller.dart';

import '/app/pages/app_root/controllers/app_root_controller.dart';
import '/app/pages/home/controllers/home_controller.dart';
import '/app/pages/profile/controllers/profile_controller.dart';
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

    Get.lazyPut<ProfileController>(
      ProfileController.new,
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      LoginController.new,
      fenix: true,
    );
    Get.lazyPut<RegistrationController>(
      RegistrationController.new,
      fenix: true,
    );
    Get.lazyPut<BookingsListController>(
      BookingsListController.new,
      fenix: true,
    );
  }
}
