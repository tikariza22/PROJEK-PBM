import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
  void decrement() => {
        if (count.value != 0) {count.value--} else {count.value = 0}
      };
}
