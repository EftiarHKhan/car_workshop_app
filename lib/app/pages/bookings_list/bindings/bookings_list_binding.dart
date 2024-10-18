import 'package:get/get.dart';
import '/app/pages/bookings_list/controllers/bookings_list_controller.dart';

class BookingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsListController>(
      () => BookingsListController(),
      fenix: true,
    );
  }
}
  