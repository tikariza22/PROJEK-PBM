import 'package:apoticare/controller/cart_view_controller.dart';
import 'package:apoticare/controller/checkout_controller.dart';
import 'package:apoticare/controller/home_view_controller.dart';
import 'package:apoticare/services/local_storage.dart';
import 'package:get/get.dart';

import '../controller/control_view_controller.dart';
import '../controller/auth_view_controller.dart';
import '../controller/maps_view_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewController());
    Get.lazyPut(() => ControlViewCont());
    Get.lazyPut(() => MapsViewController());
    Get.lazyPut(() => HomeViewController());
    Get.lazyPut(() => CartViewController());
    Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => CheckoutViewController());
  }
}
