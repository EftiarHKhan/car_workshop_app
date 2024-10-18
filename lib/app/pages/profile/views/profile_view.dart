import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/profile/controllers/profile_controller.dart';

//ignore: must_be_immutable
class ProfileView extends BaseView<ProfileController> {
  ProfileView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  