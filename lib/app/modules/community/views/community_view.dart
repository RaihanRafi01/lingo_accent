import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG image
import '../../../../common/customFont.dart';
import '../controllers/community_controller.dart';
import 'call_view.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Who you can connect with',
              style: h1.copyWith(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // You can replace this with dynamic data count
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: ClipOval(
                        child: Image.asset(
                          'assets/images/home/avatar.png',
                          // Replace with your image path
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name $index', // Replace with dynamic name
                            style:
                                h2.copyWith(color: Colors.white, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/flags/uk_rectangle.png',
                                // Replace with country flag image
                                width: 20,
                                height: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Country $index',
                                // Replace with dynamic country name
                                style: h2.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Get.to(CallView());
                        },
                        child: SvgPicture.asset(
                          'assets/images/voice/call_icon.svg',
                          // Replace with your SVG icon path
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
