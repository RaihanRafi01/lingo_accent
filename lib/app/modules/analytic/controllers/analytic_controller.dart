import 'package:get/get.dart';

class AnalyticController extends GetxController {
  int selectedTabIndex = 0;

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }
}
