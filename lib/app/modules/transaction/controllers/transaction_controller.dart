import 'package:get/get.dart';

class TransactionController extends GetxController {
  //TODO: Implement TransactionController

  // variabel untuk checking
  RxBool checked = false.obs;



  @override
  void onClose() {}

  void checking(bool check) {
    checked.value = check;
  }
}
