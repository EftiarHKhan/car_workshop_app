import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class RegistrationController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final role = ['Admin', 'Mechanic'].obs;
  final selectedRole = 'Admin'.obs;

  // Firebase Auth and Firestore instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void goToLoginView() {
    Get.offAndToNamed(Routes.login);
  }

  Future<void> onTapRegister() async {
    if (!formKey.currentState!.validate()) {
      toast('Email and password are required');
      return;
    }

    try {
      await dataFetcher(
        () async {
          // Register with email and password
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          // Save user role in Firestore
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set(
            {
              'email': emailController.text.trim(),
              'role': selectedRole.value,
            },
          );
        },
      );
      toast('Registration successful');
      Get.offAndToNamed(Routes.login);
    } catch (e) {
      toast(e.toString());
    }
  }
}
