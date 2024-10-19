import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/booking_details/controllers/booking_details_controller.dart';

//ignore: must_be_immutable
class BookingDetailsView extends BaseView<BookingDetailsController> {
  BookingDetailsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text('Booking Details'),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('BookingDetailsView'),
        ],
      ),
    );
  }
}
