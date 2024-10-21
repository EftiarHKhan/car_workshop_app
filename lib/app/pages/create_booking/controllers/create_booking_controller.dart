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
  final startDate = ''.obs;
  final endDate = ''.obs;
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
    // Submit booking logic here

    if (checkFormValidation() == false) {
      return;
    }

    /*dummyFunction();

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
        'createdAt': FieldValue.serverTimestamp(),
      },
    );*/
  }

  bool checkFormValidation() {
    if (formKey.currentState!.validate()) {
      return true;
    }

    return false;
  }

  void dummyFunction() {
    // Dummy function
    carMakeController.text = 'Mercedes-Benz';
    carModelController.text = 'C-Class';
    carYearController.text = '2020';
    carRegistrationPlateController.text = 'ABC1234';
    customerNameController.text = 'Abir Doe';
    customerEmailController.text = 'abirdoe@gmail.com';
    customerPhoneController.text = '1234567890';
    bookingTitleController.text = 'Full Service';
    startDate.value = '2024-12-08';
    endDate.value = '2024-12-10';
    selectedMechanic.value = 'akik@gmail.com';
  }
}
