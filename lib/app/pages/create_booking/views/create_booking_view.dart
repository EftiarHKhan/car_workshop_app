import 'package:car_workshop_app/app/core/base/base_controller.dart';
import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/values/custom_functions.dart';
import 'package:car_workshop_app/app/core/widget/button_component.dart';
import 'package:car_workshop_app/app/core/widget/custom_date_picker.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/create_booking/controllers/create_booking_controller.dart';

//ignore: must_be_immutable
class CreateBookingView extends BaseView<CreateBookingController> {
  CreateBookingView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Obx(
              () => Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    _buildCustomerDetails(),
                    _buildCarDetails(),
                    _buildBookingDetails(),
                    _buildAssignMechanic(),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
          top: 14,
          bottom: 14,
        ),
        child: Row(
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
              text: 'Create Booking',
              size: 24,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarDetails() {
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
              crossAxisAlignment: startCAA,
              children: [
                TextWidget(
                  text: 'Car Make',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.carMakeController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. BMW',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Car Model',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.carModelController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. 7 series',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Manufacturing Year',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.carYearController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. 2020',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Registration Number',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.carRegistrationPlateController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. ABC123',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerDetails() {
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
              crossAxisAlignment: startCAA,
              children: [
                TextWidget(
                  text: 'Name',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.customerNameController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. John',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Email',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.customerEmailController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. example@gmail.com',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Phone Number',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.customerPhoneController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. 01799605520',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingDetails() {
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
              crossAxisAlignment: startCAA,
              children: [
                TextWidget(
                  text: 'Booking Title',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                TextFormField(
                  controller: controller.bookingTitleController,
                  textInputAction: TextInputAction.next,
                  decoration: primaryInputDecoration(
                    hintText: 'e.g. service name',
                  ),
                  validator: requiredValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                16.height,
                TextWidget(
                  text: 'Start Date',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                CustomDatePicker(
                  selectedDate: controller.startDateController.text,
                  hint: controller.startDateController.text.isNotEmpty
                      ? controller.startDateController.text
                      : 'Select date',
                  isRequired: false,
                  errorText: 'Field is required',
                  enabledBorder: true,
                  contentPadding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  onChangedDate: (value) {
                    controller.startDateController.text = value ?? '';
                  },
                ),
                16.height,
                TextWidget(
                  text: 'End Date',
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
                4.height,
                CustomDatePicker(
                  selectedDate: controller.endDateController.text,
                  hint: controller.endDateController.text.isNotEmpty
                      ? controller.endDateController.text
                      : 'Select date',
                  isRequired: false,
                  errorText: 'Field is required',
                  enabledBorder: true,
                  contentPadding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  onChangedDate: (value) {
                    controller.endDateController.text = value ?? '';
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignMechanic() {
    if (controller.mechanicList.value == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Assign Mechanic',
            size: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.black,
          ),
          16.height,
          TextWidget(
            text: 'Select Mechanic',
            size: 14,
            fontWeight: FontWeight.w400,
          ),
          4.height,
          DropdownFlutter<String>(
            hintText: 'Select Mechanic',
            items: controller.mechanicList.value,
            initialItem: controller.mechanicList.value![0],
            validator: requiredValidator,
            onChanged: (value) {
              controller.selectedMechanic.value = value!;
            },
            closedHeaderPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(8),
              closedFillColor: Colors.transparent,
              closedBorder: Border.all(
                color: const Color(0xFF8B05FA).withOpacity(0.1),
              ),
              listItemStyle: GoogleFonts.jost(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              hintStyle: GoogleFonts.jost(
                fontSize: 14,
                color: const Color(0xFF8B05FA),
                fontWeight: FontWeight.w400,
              ),
              headerStyle: GoogleFonts.jost(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ButtonComponent(
        text: 'Submit',
        activeOutline: false,
        textSize: 16,
        fontWeight: FontWeight.w400,
        buttonWidth: Get.width,
        contentPaddingHorizontal: 10,
        buttonBorderRadius: 6,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0066B3),
            Color(0xFF92D6E3),
          ],
        ),
        ontap: controller.onTapSubmit,
      ),
    );
  }
}
