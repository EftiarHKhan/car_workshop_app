import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final role = ['Admin', 'Mechanic'].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void goToRegistrationView() {
    Get.offAndToNamed(Routes.registration);
  }
}
