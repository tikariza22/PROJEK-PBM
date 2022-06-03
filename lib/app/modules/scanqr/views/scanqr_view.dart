import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scanqr_controller.dart';

class ScanqrView extends GetView<ScanqrController> {
  final scanqrC = Get.put(ScanqrController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          scanqrC.scanQR();
        },
        child: Text("Scan qr"),
      ),
    );
  }
}