import 'package:get/get.dart';
import '/app/pages/statistics/controllers/statistics_controller.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(
      () => StatisticsController(),
      fenix: true,
    );
  }
}
  