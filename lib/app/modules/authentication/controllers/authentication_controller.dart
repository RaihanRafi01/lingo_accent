import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  var username = ''.obs;
  var password = ''.obs; // Password field
  var isPasswordStep = false.obs; // Track if we're on the password step
}