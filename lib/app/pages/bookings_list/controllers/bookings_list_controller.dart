import 'package:car_workshop_app/app/model/booking_details.dart';
import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class BookingsListController extends BaseController {
  final role = ''.obs;
  final bookingList = Rx<List<BookingDetails>?>(null);

  // Firebase Auth and Firestore instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    final args = Get.arguments;
    role.value = args['role'];
    await fetchBookings();
  }

  Future<void> logout() async {
    try {
      await auth.signOut();

      Get.offAllNamed(Routes.login);
    } catch (e) {
      // Handle any errors during the logout process
      print('Error logging out: $e');
      toast('Error logging out');
    }
  }

  Future<void> fetchBookings() async {
    try {
      final snapshot = await _firestore.collection('bookings').get();
      if (snapshot.docs.isNotEmpty) {
        bookingList.value = snapshot.docs
            .map((doc) => BookingDetails.fromJson(doc.data()))
            .toList();
      }
    } catch (e, errorStackTrace) {
      // Handle any errors during the fetch process
      print('Error fetching bookings: $e');
      print('Error stack trace: $errorStackTrace');
      toast('Error fetching bookings');
    }
  }

  void navigateToBookingDetails() {
    Get.toNamed(Routes.bookingDetails);
  }

  void navigateToCreateBooking() {
    Get.toNamed(Routes.createBooking);
  }
}
