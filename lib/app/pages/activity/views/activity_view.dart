import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/activity/controllers/activity_controller.dart';

//ignore: must_be_immutable
class ActivityView extends BaseView<ActivityController> {
  ActivityView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  