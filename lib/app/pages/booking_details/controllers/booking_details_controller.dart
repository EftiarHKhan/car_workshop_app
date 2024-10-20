import 'package:car_workshop_app/app/model/booking_details.dart';
import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';

class BookingDetailsController extends BaseController {
  final bookingDetails = Rx<BookingDetails?>(null);
  final markedAsComplete = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final args = await Get.arguments;
    bookingDetails.value = args['bookingDetails'];
  }
}
