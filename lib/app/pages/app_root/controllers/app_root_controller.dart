import '/app/core/values/asset_values.dart';

import '/app/pages/activity/views/activity_view.dart';
import '/app/pages/app_root/model/navbar_items.dart';
import '/app/pages/home/views/home_view.dart';
import '/app/pages/profile/views/profile_view.dart';
import '/app/pages/statistics/views/statistics_view.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class AppRootController extends BaseController {
  RxInt selectedIndex = 0.obs;
  RxInt hoveredIndex = 0.obs;

  RxList<NavbarItems> navbarItems = [
    NavbarItems(
      navbarName: "Home",
      selectedIconName: AssetValues.homeIcon,
      pages: HomeView(),
    ),
    NavbarItems(
      navbarName: "Activity",
      selectedIconName: AssetValues.activityIcon,
      pages: ActivityView(),
    ),
    NavbarItems(
      navbarName: "Statistics",
      selectedIconName: AssetValues.statisticsIcon,
      pages: StatisticsView(),
    ),
    NavbarItems(
      navbarName: "Profile",
      selectedIconName: AssetValues.profileIcon,
      pages: ProfileView(),
    ),
  ].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
