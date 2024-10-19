import 'package:car_workshop_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_controller.dart';

class BookingsListController extends BaseController {
  final role = ''.obs;

  // Firebase Auth and Firestore instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    final args = Get.arguments;
    role.value = args['role'];
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
}
