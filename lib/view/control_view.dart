import 'package:apoticare/controller/auth_view_controller.dart';
import 'package:apoticare/view/home_view.dart';
import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/control_view_controller.dart';

import 'widget/custom_text.dart';

class ControlView extends GetWidget<AuthViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewController>().user == null)
          ? WelcomeView()
          : GetBuilder<ControlViewCont>(
              builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: CustomBottomNavigationBar(),
                  ));
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: GetBuilder<ControlViewCont>(
        builder: (controller) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.changeCurrentScreen(index);
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront_outlined,
                color: Colors.black,
              ),
              label: "PRODUK",
              activeIcon: Icon(
                Icons.storefront_outlined,
                color: Color(0xff38B0A9),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              label: "LOCASI",
              activeIcon: Icon(
                Icons.location_on_outlined,
                color: Color(0xff38B0A9),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.black,
              ),
              label: "SCAN QR",
              activeIcon: Icon(
                Icons.qr_code_scanner_outlined,
                color: Color(0xff38B0A9),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_outlined,
                color: Colors.black,
              ),
              label: "TRANSAKSI",
              activeIcon: Icon(
                Icons.assignment_outlined,
                color: Color(0xff38B0A9),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              label: "PROFIL",
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xff38B0A9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
