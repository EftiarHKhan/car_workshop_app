import 'package:car_workshop_app/app/core/values/app_colors.dart';
import 'package:car_workshop_app/app/core/values/text_styles.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          const Text(
            'Registration View',
            style: bigTitleStyle,
          ),
          30.height,
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          16.height,
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          16.height,
          DropdownFlutter<String>(
            hintText: 'Select job role',
            items: controller.role,
            initialItem: controller.role[0],
            onChanged: (value) {
              log('changing value to: $value');
            },
          ),
          16.height,
          Row(
            mainAxisAlignment: centerMAA,
            children: [
              const Text('Already have an account?'),
              8.width,
              InkWell(
                onTap: controller.goToLoginView,
                child: const Text(
                  'Login',
                ),
              ),
            ],
          ),
          20.height,
          InkWell(
            onTap: controller.onTapRegister,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Register',
                style: labelStyleWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
