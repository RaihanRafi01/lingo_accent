import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_accent/app/modules/profile/views/reset_password_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/widgets/settings/customTextField2.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121829),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _buildHeader(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomTextField2(
                    labelText: 'Name',
                    hintText: '',
                    endIconPath: 'assets/images/settings/edit_icon.svg',
                    onSuffixTap: () {},
                  ),
                  SizedBox(height: 20),
                  CustomTextField2(labelText: 'Email', hintText: ''),
                  SizedBox(height: 20),
                  CustomTextField2(
                      labelText: 'Password',
                      hintText: '',
                      endIconPath: 'assets/images/settings/edit_icon.svg',
                      onSuffixTap: () {
                        Get.to(ResetPasswordView());
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Circular part on the left
        CircularPercentIndicator(
          backgroundColor: Colors.transparent,
          radius: 40.0,
          lineWidth: 5.0,
          percent: 0.3,
          center: Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 27,
              backgroundImage: AssetImage('assets/images/home/avatar.png'),
            ),
          ),
          progressColor: Colors.blue,
        ),
        SizedBox(
          width: 20,
        ),
        // Text part centered horizontally in the remaining space
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Hello, Sourasith',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'You have Completed level 1',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
