import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:car_workshop_app/app/model/booking_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/bookings_list/controllers/bookings_list_controller.dart';

//ignore: must_be_immutable
class BookingsListView extends BaseView<BookingsListController> {
  BookingsListView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Obx(
        () {
          return Column(
            children: [
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Expanded(
                  child: _buildBookingList(),
                ),
              ),
            ],
          );
        },
      ),
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
            offset: Offset(0, 1),
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
            TextWidget(
              text: 'Booking List',
              size: 24,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
            ),
            8.width,
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt_sharp,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: controller.logout,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    iconColor: WidgetStateProperty.all<Color>(Colors.white),
                  ),
                  iconSize: 24,
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList() {
    return ListView.builder(
      itemCount: controller.bookingList.value?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final bookingDetails = controller.bookingList.value![index];
        return _buildCardView(
          bookingDetails: bookingDetails,
        );
      },
    );
  }

  Widget _buildCardView({
    required BookingDetails bookingDetails,
  }) {
    return GestureDetector(
      onTap: () => controller.navigateToBookingDetails(
        bookingDetails: bookingDetails,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: minMAS,
          crossAxisAlignment: startCAA,
          children: [
            TextWidget(
              text: '# ${bookingDetails.bookingTitle}',
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            8.height,
            Row(
              children: [
                const Icon(
                  Icons.car_crash,
                  size: 20,
                ),
                4.width,
                TextWidget(
                  text:
                      '${bookingDetails.carMake} - ${bookingDetails.carModel} - ${bookingDetails.carYear}',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            8.height,
            Row(
              children: [
                const Icon(
                  Icons.person_add_alt_1,
                  size: 20,
                ),
                4.width,
                TextWidget(
                  text: '${bookingDetails.mechanic}',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            8.height,
            Row(
              mainAxisAlignment: spaceBetweenMAA,
              children: [
                TextWidget(
                  text:
                      'Start date: ${bookingDetails.startDate.day}/${bookingDetails.startDate.month}/${bookingDetails.startDate.year}',
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
                8.width,
                TextWidget(
                  text:
                      'End date: ${bookingDetails.endDate.day}/${bookingDetails.endDate.month}/${bookingDetails.endDate.year}',
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButton() {
    if (controller.role.value == 'Mechanic') return null;

    return TextButton(
      onPressed: controller.navigateToCreateBooking,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.colorPrimary),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      child: TextWidget(
        text: 'Create Booking',
        size: 14,
        fontWeight: FontWeight.w600,
        textColor: Colors.white,
      ),
    );
  }

  @override
  FloatingActionButtonLocation floatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }
}
