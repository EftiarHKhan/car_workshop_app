import 'package:car_workshop_app/app/core/base/base_controller.dart';
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
              8.height,
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
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: spaceBetweenMAA,
        children: [
          TextWidget(
            text: 'Booking List',
            size: 24,
            fontWeight: FontWeight.w700,
          ),
          8.width,
          TextButton(
            onPressed: controller.logout,
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            iconAlignment: IconAlignment.end,
            child: const Icon(
              Icons.logout,
              size: 20,
              color: Colors.red,
            ),
          ),
        ],
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
    return InkWell(
      onTap: controller.navigateToBookingDetails,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8),
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
          children: [
            Text('booking title: ${bookingDetails.bookingTitle}'),
            8.height,
            Row(
              mainAxisAlignment: spaceBetweenMAA,
              children: [
                Text(
                    ' start date: ${bookingDetails.startDate.day}/${bookingDetails.startDate.month}/${bookingDetails.startDate.year}'),
                8.width,
                Text(
                    ' end date: ${bookingDetails.endDate.day}/${bookingDetails.endDate.month}/${bookingDetails.endDate.year}'),
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

    return FloatingActionButton(
      onPressed: controller.navigateToCreateBooking,
      child: Icon(Icons.add),
    );
  }

  @override
  FloatingActionButtonLocation floatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }
}
