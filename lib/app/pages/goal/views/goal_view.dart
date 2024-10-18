import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/pages/goal/controllers/goal_controller.dart';

//ignore: must_be_immutable
class GoalView extends BaseView<GoalController> {
  GoalView({super.key});
    
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  
  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
  