import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/maps_controller.dart';

class MapsController extends GetxController {
  //TODO: Implement MapsController
  Completer<GoogleMapController> _controller = Completer();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
}
