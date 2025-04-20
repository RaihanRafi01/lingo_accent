import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs; // Default selected index is Home

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
