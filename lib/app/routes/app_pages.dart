import 'package:get/get.dart';

import '/app/pages/splash/bindings/splash_binding.dart';
import '/app/pages/splash/views/splash_view.dart';

import '/app/pages/app_root/bindings/app_root_binding.dart';
import '/app/pages/app_root/views/app_root_view.dart';
import '/app/pages/home/bindings/home_binding.dart';
import '/app/pages/home/views/home_view.dart';
import '/app/pages/profile/bindings/profile_binding.dart';
import '/app/pages/profile/views/profile_view.dart';
import '/app/pages/create_booking/bindings/create_booking_binding.dart';
import '/app/pages/create_booking/views/create_booking_view.dart';
import '/app/pages/bookings_list/bindings/bookings_list_binding.dart';
import '/app/pages/bookings_list/views/bookings_list_view.dart';
import '/app/pages/booking_details/bindings/booking_details_binding.dart';
import '/app/pages/booking_details/views/booking_details_view.dart';
import '../pages/intro/login/bindings/login_binding.dart';
import '../pages/intro/login/views/login_view.dart';
import '../pages/intro/registration/bindings/registration_binding.dart';
import '../pages/intro/registration/views/registration_view.dart';

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
      name: Routes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.registration,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: Routes.createBooking,
      page: () => CreateBookingView(),
      binding: CreateBookingBinding(),
    ),
    GetPage(
      name: Routes.bookingsList,
      page: () => BookingsListView(),
      binding: BookingsListBinding(),
    ),
    GetPage(
      name: Routes.bookingDetails,
      page: () => BookingDetailsView(),
      binding: BookingDetailsBinding(),
    ),
  ];
}
