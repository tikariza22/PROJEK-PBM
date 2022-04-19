import 'package:apoticare/app/modules/login/views/login_view.dart';
import 'package:apoticare/app/modules/product/views/product_view.dart';
import 'package:apoticare/app/modules/profile/views/profile_view.dart';
import 'package:apoticare/app/modules/register/views/register_view.dart';
import 'package:apoticare/app/modules/welcome/views/welcome_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeC = Get.put(HomeController());

  final List<Widget> _widgetOptions = <Widget>[
    ProductView(),
    ProductView(),
    ProductView(),
    ProductView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'SEDAYU APOTEK',
          style: TextStyle(color: Color(0xff38B0A9)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Obx(
        () => _widgetOptions.elementAt(homeC.selectedItem.value),
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.storefront_outlined,
                    color: Colors.black,
                  ),
                  label: "PRODUK"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  label: "LOCASI"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_scanner_outlined,
                    color: Colors.black,
                  ),
                  label: "SCAN QR"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.assignment_outlined,
                    color: Colors.black,
                  ),
                  label: "PESANAN"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  label: "PROFIL"),
            ],
            onTap: homeC.onItemTap,
            currentIndex: homeC.selectedItem.value,
          )),
    );
  }
}
