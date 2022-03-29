import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("hahahaha"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.storefront,
            color: Colors.black,
          ),
          label: "product",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            label: "lokasi"),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined), label: "qr scan"),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined), label: "pesanan"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: "profil"),
      ]),
    );
  }
}
