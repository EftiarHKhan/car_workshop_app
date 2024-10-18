import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_view.dart';
import '/app/pages/app_root/controllers/app_root_controller.dart';

//ignore: must_be_immutable
class AppRootView extends BaseView<AppRootController> {
  AppRootView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  pageBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return controller.navbarItems[controller.selectedIndex.value].pages;
    });
  }

  @override
  Widget? bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          controller.navbarItems.length,
          (index) {
            return Obx(() {
              return Expanded(
                child: InkWell(
                  onTap: () async {
                    controller.selectedIndex.value = index;
                  },
                  child: Container(
                    width: Get.width * .22,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AssetImageView(
                              fileName: controller
                                  .navbarItems[index].selectedIconName,
                              width: 24,
                              height: 24,
                              color: controller.selectedIndex.value == index
                                  ? const Color(0xFFF97316)
                                  : const Color(0xFF667085),
                            ),
                            4.height,
                            TextWidget(
                              text: controller.navbarItems[index].navbarName,
                              fontWeight: FontWeight.bold,
                              size: 12,
                              textColor: controller.selectedIndex.value == index
                                  ? const Color(0xFFF97316)
                                  : const Color(0xFF667085),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
