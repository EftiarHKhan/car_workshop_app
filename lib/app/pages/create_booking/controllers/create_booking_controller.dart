import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';

class CreateBookingController extends BaseController {
  final carMakeController = TextEditingController();
  final carModelController = TextEditingController();
  final carYearController = TextEditingController();
  final carRegistrationPlateController = TextEditingController();

  final customerNameController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerPhoneController = TextEditingController();

  final bookingTitleController = TextEditingController();
  final startDate = ''.obs;
  final endDate = ''.obs;
  final mechanicList = Rx<List<String>?>(null);
  final selectedMechanic = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    mechanicList.value = ['John Doe', 'Jane Doe', 'John Smith'];
  }

  Future<void> onTapSubmit() async {
    // Submit booking logic here

    dummyFunction();

    // save booking to Firestore
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
        'startDate': startDate.value,
        'endDate': endDate.value,
        'mechanic': selectedMechanic.value,
      },
    );
  }

  void dummyFunction() {
    // Dummy function
    carMakeController.text = 'Toyota';
    carModelController.text = 'Corolla';
    carYearController.text = '2020';
    carRegistrationPlateController.text = 'ABC1234';
    customerNameController.text = 'John Doe';
    customerEmailController.text = 'johndoe@gmail.com';
    customerPhoneController.text = '1234567890';
    bookingTitleController.text = 'Oil Change';
    startDate.value = '2024-12-01';
    endDate.value = '2024-12-02';
    selectedMechanic.value = 'hridoy@gmail.com';
  }
}
