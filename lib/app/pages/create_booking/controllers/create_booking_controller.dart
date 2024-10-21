import 'package:car_workshop_app/app/pages/bookings_list/controllers/bookings_list_controller.dart';
import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class CreateBookingController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final carMakeController = TextEditingController();
  final carModelController = TextEditingController();
  final carYearController = TextEditingController();
  final carRegistrationPlateController = TextEditingController();

  final customerNameController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerPhoneController = TextEditingController();

  final bookingTitleController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final mechanicList = Rx<List<String>?>(null);
  final selectedMechanic = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchingMechanics();
  }

  Future<void> fetchingMechanics() async {
    try {
      await dataFetcher(
        () async {
          final snapshot = await _firestore.collection('users').get();
          var response = <Map<String, dynamic>>[];
          if (snapshot.docs.isNotEmpty) {
            response = snapshot.docs.map((doc) => doc.data()).toList();
          }
          mechanicList.value = response
              .where((element) => element['role'] == 'Mechanic')
              .map((e) => e['email'])
              .cast<String>()
              .toList();
        },
      );
    } catch (e) {
      // Handle any errors during the fetching process
      print('Error fetching mechanics: $e');
      toast('Error fetching mechanics');
    }
  }

  Future<void> onTapSubmit() async {
    if (checkFormValidation() == false) {
      return;
    }

    // save booking to Fire store
    await dataFetcher(
      () async {
        await _firestore.collection('bookings').add(
          {
            'carMake': carMakeController.text.trim(),
            'carModel': carModelController.text.trim(),
            'carYear': carYearController.text.trim(),
            'carRegistrationPlate': carRegistrationPlateController.text.trim(),
            'customerName': customerNameController.text.trim(),
            'customerEmail': customerEmailController.text.trim(),
            'customerPhone': customerPhoneController.text.trim(),
            'bookingTitle': bookingTitleController.text.trim(),
            'startDate': startDateController.text.trim(),
            'endDate': endDateController.text.trim(),
            'mechanic': selectedMechanic.value,
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      },
    );

    final bookingListController = Get.find<BookingsListController>();
    await bookingListController.fetchBookings();
    Get.offAndToNamed(
      Routes.bookingsList,
      arguments: {
        'role': 'Admin',
      },
    );
  }

  bool checkFormValidation() {
    if (formKey.currentState!.validate()) {
      return true;
    }

    return false;
  }
}
