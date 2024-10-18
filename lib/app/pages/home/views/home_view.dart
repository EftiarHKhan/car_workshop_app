import '/app/core/values/app_colors.dart';
import '/app/core/widget/input_field_one.dart';

import '/app/core/values/asset_values.dart';
import '/app/core/widget/asset_image_view.dart';

import '/app/core/widget/network_image_widget.dart';
import '/app/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';

//ignore: must_be_immutable
class HomeView extends BaseView<HomeController> {
  HomeView({super.key});




  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: NetworkImageWidget(
              imageUrl: '',
              imageHeight: 45,
              imageWidth: 45,
            ),
          ),
          10.width,
          Column(
            crossAxisAlignment: startCAA,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: 'Hello! ',
                    fontWeight: FontWeight.normal,
                    size: 18,
                    textColor: const Color(0xFF000B23),
                    height: 1.6,
                  ),
                  TextWidget(
                    text: 'Johan Smith',
                    fontWeight: FontWeight.w500,
                    size: 16,
                    textColor: const Color(0xFF000B23),
                    height: 1.6,
                  ),
                ],
              ),
              TextWidget(
                text: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                fontWeight: FontWeight.normal,
                size: 12,
                textColor: const Color(0xFF7B7B7B),
              ),
            ],
          ),
        ],
      ),
      actions: [
        const AssetImageView(
          fileName: AssetValues.alarmWithBadgeIcon,
          width: 40,
          height: 40,
        ),
        16.width,
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      child: Column(
        children: [
          searchSection(),
          yourStatisticsSection(),
          dailyActivitiesSection(),
          goalsSection(),
        ],
      ),
    );
  }

  Widget searchSection() {
    return Container(
      child: InputFieldOne(
        textController: controller.searchController,
        isRequired: false,
        enabledBorder: true,
        prefixIcon: Icons.search,
        hint: 'Search',
        borderColor: AppColors.borderPrimaryColor,
      ),
    );
  }

  Widget yourStatisticsSection() {
    return Container();
  }

  Widget dailyActivitiesSection() {
    return Container();
  }

  Widget goalsSection() {
    return Container();
  }
}
