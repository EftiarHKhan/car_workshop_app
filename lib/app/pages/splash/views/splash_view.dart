import 'package:car_workshop_app/app/core/widget/asset_image_view.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/splash/controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AssetImageView(
            fileName: 'im_logo.png',
            width: 200,
          ),
          Row(
            mainAxisAlignment: centerMAA,
            crossAxisAlignment: startCAA,
            children: [
              TextWidget(
                text: 'ICHIBAN',
                size: 24,
                fontWeight: FontWeight.bold,
                textColor: const Color(0xFFD71E23),
              ),
              TextWidget(
                text: 'AUTO',
                size: 24,
                fontWeight: FontWeight.bold,
                textColor: const Color(0xFF7D8282),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
