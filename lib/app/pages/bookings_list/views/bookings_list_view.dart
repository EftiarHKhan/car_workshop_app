import 'package:car_workshop_app/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: spaceBetweenMAA,
            children: [
              Text('BookingsListView'),
              8.width,
              TextButton(
                onPressed: controller.logout,
                child: Text('Logout'),
              ),
            ],
          ),
          16.height,
          Expanded(
            child: _buildBookingList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingList() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildCardView();
      },
    );
  }

  Widget _buildCardView() {
    return InkWell(
      onTap: controller.navigateToBookingDetails,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
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
            Text('booking title'),
            8.height,
            Row(
              mainAxisAlignment: spaceBetweenMAA,
              children: [
                Text('booking date'),
                8.width,
                Text('booking time'),
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
