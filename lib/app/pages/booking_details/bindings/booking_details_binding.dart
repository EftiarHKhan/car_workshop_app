import 'package:get/get.dart';
import '/app/pages/booking_details/controllers/booking_details_controller.dart';

class BookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingDetailsController>(
      () => BookingDetailsController(),
      fenix: true,
    );
  }
}
  