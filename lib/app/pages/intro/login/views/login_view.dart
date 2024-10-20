import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/values/custom_functions.dart';
import 'package:car_workshop_app/app/core/widget/asset_image_view.dart';
import 'package:car_workshop_app/app/core/widget/button_component.dart';
import 'package:car_workshop_app/app/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/base/base_view.dart';
import '../controllers/login_controller.dart';

//ignore: must_be_immutable
class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

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
            text: 'Login',
            size: 24,
            fontWeight: FontWeight.w500,
            textColor: Colors.black,
            height: 1.2,
          ),
          4.height,
          TextWidget(
            text: 'Please enter your Email & Password here',
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
        ],
      ),
    );
  }

  Widget _buildAccountSwitch() {
    return Row(
      mainAxisAlignment: centerMAA,
      children: [
        TextWidget(
          text: 'Don\'t have an account?',
          size: 14,
          fontWeight: FontWeight.w400,
          textColor: Colors.black,
          height: 1.2,
        ),
        8.width,
        InkWell(
          onTap: controller.goToRegistrationView,
          child: TextWidget(
            text: 'Register',
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
      text: 'Login',
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
      ontap: controller.onTapLogin,
    );
  }
}
