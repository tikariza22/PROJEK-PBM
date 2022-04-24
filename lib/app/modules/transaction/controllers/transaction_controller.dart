import 'package:get/get.dart';

class TransactionController extends GetxController {
  //TODO: Implement TransactionController

  // variabel untuk checking
  RxBool checked = false.obs;

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

  void checking(bool check) {
    checked.value = check;
  }
}
