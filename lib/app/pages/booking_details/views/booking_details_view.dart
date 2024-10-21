import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/widget/asset_image_view.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/booking_details/controllers/booking_details_controller.dart';
import 'package:intl/intl.dart';

//ignore: must_be_immutable
class BookingDetailsView extends BaseView<BookingDetailsController> {
  BookingDetailsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildBody(),
      ],
    );
  }

  Widget _buildBackground() {
    return Opacity(
      opacity: .1,
      child: Container(
        height: Get.height,
        width: Get.width,
        child: const AssetImageView(fileName: 'im_car.png'),
      ),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => Column(
        children: [
          _buildHeader(),
          16.height,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildAssignedMechanic(),
                  _buildBookingInfo(),
                  _buildCarInfo(),
                  _buildCustomerInfo(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAssignedMechanic() {
    return TextWidget(
      text: 'Assigned to: ${controller.bookingDetails.value?.mechanic}',
      size: 18,
      fontWeight: FontWeight.w500,
      textColor: Colors.black,
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorPrimary.withOpacity(.8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: spaceBetweenMAA,
          children: [
            Row(
              mainAxisAlignment: startMAA,
              children: [
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                8.width,
                TextWidget(
                  text: 'Booking Details',
                  size: 24,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                controller.markedAsComplete.value =
                    !controller.markedAsComplete.value;
                toast(
                  controller.markedAsComplete.value
                      ? 'Marked as Complete'
                      : 'Marked as Pending',
                );
              },
              icon: Icon(
                controller.markedAsComplete.value
                    ? Icons.mark_chat_unread_outlined
                    : Icons.check_circle_outline,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Booking Information',
            size: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.black,
          ),
          8.height,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  crossAxisAlignment: startCAA,
                  children: [
                    TextWidget(
                      text: 'Booking Title',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    16.width,
                    Expanded(
                      child: TextWidget(
                        text:
                            '${controller.bookingDetails.value?.bookingTitle}',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black,
                        maxLine: 2,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Booking Date',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: controller.bookingDetails.value?.startDate != null
                          ? DateFormat('dd MMM, yyyy').format(
                              controller.bookingDetails.value!.startDate,
                            )
                          : '',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Delivery Date',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: controller.bookingDetails.value?.endDate != null
                          ? DateFormat('dd MMM, yyyy').format(
                              controller.bookingDetails.value!.endDate,
                            )
                          : '',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Booking Status',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: controller.markedAsComplete.value
                          ? 'Complete'
                          : 'Pending',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Car Information',
            size: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.black,
          ),
          8.height,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Car Brand',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.carMake}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Car Model',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.carModel}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Manufacturing Year',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.carYear}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Registration Number',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text:
                          '${controller.bookingDetails.value?.carRegistrationPlate}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Customer Information',
            size: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.black,
          ),
          8.height,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Customer Name',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.customerName}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Email',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.customerEmail}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: spaceBetweenMAA,
                  children: [
                    TextWidget(
                      text: 'Phone Number',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    TextWidget(
                      text: '${controller.bookingDetails.value?.customerPhone}',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
