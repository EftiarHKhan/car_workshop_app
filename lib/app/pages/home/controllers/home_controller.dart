import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';

class HomeController extends BaseController {
  final searchController = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
