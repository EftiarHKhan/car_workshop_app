import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
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
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      toast('Email and password are required');
      return;
    }

    try {
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

      String role = userSnapshot.get('role');
      toast('Login successful');

      // Navigate to different dashboards based on role
      if (role == 'Admin') {
        // Navigate to admin dashboard
        print('user is admin');
      } else if (role == 'Mechanic') {
        // Navigate to mechanic dashboard
        print('user is mechanic');
      }
    } catch (e) {
      toast('Invalid email or password');
    }
  }
}
