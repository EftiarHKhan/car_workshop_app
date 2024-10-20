import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/values/custom_functions.dart';
import 'package:car_workshop_app/app/core/values/text_styles.dart';
import 'package:car_workshop_app/app/core/widget/asset_image_view.dart';
import 'package:car_workshop_app/app/core/widget/button_component.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '../controllers/registration_controller.dart';

//ignore: must_be_immutable
class RegistrationView extends BaseView<RegistrationController> {
  RegistrationView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: centerCAA,
          children: [
            _buildHeader(),
            20.height,
            _buildSubHeader(),
            20.height,
            _buildForm(),
            20.height,
            _buildAccountSwitch(),
            30.height,
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const AssetImageView(
      fileName: 'im_logo.png',
      height: 200,
    );
  }

  Widget _buildSubHeader() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Registration',
            size: 24,
            fontWeight: FontWeight.w500,
            textColor: Colors.black,
            height: 1.2,
          ),
          4.height,
          TextWidget(
            text: 'Please enter your Email, Password & select Role here',
            size: 14,
            fontWeight: FontWeight.w400,
            textColor: const Color(0xFF8D8D8D),
            height: 1.2,
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: startCAA,
        children: [
          TextWidget(
            text: 'Email',
            size: 14,
            fontWeight: FontWeight.w400,
          ),
          4.height,
          TextFormField(
            controller: controller.emailController,
            textInputAction: TextInputAction.next,
            decoration: primaryInputDecoration(
              hintText: 'example@gmail.com',
            ),
            validator: emailValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          16.height,
          TextWidget(
            text: 'Password',
            size: 14,
            fontWeight: FontWeight.w400,
          ),
          4.height,
          TextFormField(
            controller: controller.passwordController,
            textInputAction: TextInputAction.done,
            decoration: primaryInputDecoration(
              hintText: 'example123',
            ),
            validator: requiredValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          16.height,
          TextWidget(
            text: 'Role',
            size: 14,
            fontWeight: FontWeight.w400,
          ),
          4.height,
          DropdownFlutter<String>(
            hintText: 'Select job role',
            items: controller.role,
            initialItem: controller.role[0],
            onChanged: (value) {
              controller.selectedRole.value = value!;
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

  Widget _buildAccountSwitch() {
    return Row(
      mainAxisAlignment: centerMAA,
      children: [
        TextWidget(
          text: 'Already have an account?',
          size: 14,
          fontWeight: FontWeight.w400,
          textColor: Colors.black,
          height: 1.2,
        ),
        8.width,
        InkWell(
          onTap: controller.goToLoginView,
          child: TextWidget(
            text: 'Login',
            size: 14,
            textColor: AppColors.colorPrimary,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ButtonComponent(
      text: 'Register',
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
      ontap: controller.onTapRegister,
    );
  }
}
