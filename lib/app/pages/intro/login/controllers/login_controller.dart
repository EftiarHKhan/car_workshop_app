import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
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

  void goToRegistrationView() {
    Get.offAndToNamed(Routes.registration);
  }

  Future<void> onTapLogin() async {
    if (!formKey.currentState!.validate()) {
      toast('Email and password are required');
      return;
    }

    String role = '';

    try {
      await dataFetcher(
        () async {
          // Sign in with email and password
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          // Fetch user role from Firestore
          DocumentSnapshot userSnapshot = await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();

          role = userSnapshot.get('role');
        },
      );

      toast('Login successful');

      Get.toNamed(
        Routes.bookingsList,
        arguments: {
          'role': role,
        },
      );
    } catch (e) {
      toast('Invalid email or password');
    }
  }
}
