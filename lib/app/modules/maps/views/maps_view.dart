import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  final mapsC = Get.put(MapsController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        markers: {mapsC.destination},
        initialCameraPosition: CameraPosition(
          target: LatLng(
            mapsC.latitude.value,
            mapsC.longitude.value,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
