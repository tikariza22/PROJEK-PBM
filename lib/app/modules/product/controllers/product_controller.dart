import 'package:get/get.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
