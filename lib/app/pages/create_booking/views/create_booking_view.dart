import 'package:car_workshop_app/app/core/base/base_controller.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
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
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('CreateBookingView'),
            16.height,
            _buildCarDetails(),
            16.height,
            _buildCustomerDetails(),
            16.height,
            _buildBookingDetails(),
            16.height,
            _buildAssignMechanic(),
            16.height,
            _buildSubmitButton(),
            16.height,
          ],
        ),
      ),
    );
  }

  Widget _buildCarDetails() {
    return Column(
      children: [
        Text('Car Details'),
        16.height,
        TextFormField(
          controller: controller.carMakeController,
          decoration: const InputDecoration(
            labelText: 'Car Make',
          ),
        ),
        TextFormField(
          controller: controller.carModelController,
          decoration: const InputDecoration(
            labelText: 'Car Model',
          ),
        ),
        TextFormField(
          controller: controller.carYearController,
          decoration: const InputDecoration(
            labelText: 'Car Year',
          ),
        ),
        TextFormField(
          controller: controller.carRegistrationPlateController,
          decoration: const InputDecoration(
            labelText: 'Car Registration Plate',
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerDetails() {
    return Column(
      children: [
        Text('Customer Details'),
        16.height,
        TextFormField(
          controller: controller.customerNameController,
          decoration: const InputDecoration(
            labelText: 'Customer Name',
          ),
        ),
        TextFormField(
          controller: controller.customerEmailController,
          decoration: const InputDecoration(
            labelText: 'Customer Email',
          ),
        ),
        TextFormField(
          controller: controller.customerPhoneController,
          decoration: const InputDecoration(
            labelText: 'Customer Phone',
          ),
        ),
      ],
    );
  }

  Widget _buildBookingDetails() {
    return Column(
      children: [
        Text('Booking Details'),
        16.height,
        TextFormField(
          controller: controller.bookingTitleController,
          decoration: const InputDecoration(
            labelText: 'Booking Title',
          ),
        ),
      ],
    );
  }

  Widget _buildAssignMechanic() {
    return Column(
      children: [
        Text('Assign Mechanic'),
        16.height,
        DropdownFlutter<String>(
          hintText: 'Select Mechanic',
          items: controller.mechanicList.value,
          initialItem: controller.mechanicList.value![0],
          onChanged: (value) {
            controller.selectedMechanic.value = value!;
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton(){
    return InkWell(
      onTap: controller.onTapSubmit,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
