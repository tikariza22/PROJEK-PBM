import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SEDAYU APOTEK',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_outlined,
              color: Colors.black,
            ),
            label: "sadas"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
          label: "asdsd",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.black,
          ),
          label: "asdsd",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_outlined,
            color: Colors.black,
          ),
          label: "asdasd",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
          label: "asdasd",
        ),
      ]),
    );
  }
}
