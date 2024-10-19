import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/create_booking/controllers/create_booking_controller.dart';

//ignore: must_be_immutable
class CreateBookingView extends BaseView<CreateBookingController> {
  CreateBookingView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text('Create Booking'),
    );
  }
  
  @override
  Widget body(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('CreateBookingView'),
        ],
      ),
    );
  }
}
  