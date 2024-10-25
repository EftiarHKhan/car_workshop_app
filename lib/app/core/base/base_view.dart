import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/core_model/page_state.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';
import 'mixins/shorter_enum_mixin.dart';
import 'mixins/validator_mixin.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> with ValidatorMixin, ShorterEnumMixin {
  BaseView({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(
            () => controller.pageState == PageState.loading
                ? _showLoading()
                : Container(),
          ),
          Obx(
            () => controller.errorMessage.isNotEmpty
                ? showErrorSnackBar(controller.errorMessage)
                : Container(),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(context),
      floatingActionButtonLocation: floatingActionButtonLocation(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      },
    );

    return Container();
  }

  void showToast(String message) {
    toast(message);
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }



  Widget? bottomNavigationBar() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
