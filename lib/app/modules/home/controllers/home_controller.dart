import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final RxInt selectedItem = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
  void onItemTap(int index) {
    selectedItem.value = index;
  }
}
