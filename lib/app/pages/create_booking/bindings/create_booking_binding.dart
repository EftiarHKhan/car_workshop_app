import 'package:get/get.dart';
import '/app/pages/create_booking/controllers/create_booking_controller.dart';

class CreateBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBookingController>(
      () => CreateBookingController(),
      fenix: true,
    );
  }
}
  