import 'package:apoticare/view/cart_view.dart';
import 'package:apoticare/view/home_view.dart';
import 'package:apoticare/view/maps_view.dart';
import 'package:apoticare/view/profile_view.dart';
import 'package:apoticare/view/scan_qr_view.dart';
import 'package:apoticare/view/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewCont extends GetxController {
  Widget _currentScreen = HomeView();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  changeCurrentScreen(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = MapsView();
        break;
      case 2:
        _currentScreen = ScanqrView();
        break;
      case 3:
        _currentScreen = TransactionView();
        break;
      case 4:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}
