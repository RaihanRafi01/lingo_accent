import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'common/appColors.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        // Set the background color to black
        primaryColor: AppColors.appColor,
        // Set the theme color to blue
        appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.appColor, // Set AppBar background color to blue
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          // Set text color to white for visibility on black
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
