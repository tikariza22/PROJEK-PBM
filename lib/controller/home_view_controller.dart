import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/products_model.dart';

import '../services/flutter_product.dart';

class HomeViewController extends GetxController {
  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _getProductsFromFireStore();
  }

  _getProductsFromFireStore() async {
    try {
      _loading = true;
      // FirestoreProduct().getProductsFromFirestore().then((value) {
      //   for (int i = 0; i < value.length; i++) {
      //     print(value[i].data());
      //   }
      // });
      List<QueryDocumentSnapshot> productsSnapshot =
          await FirestoreProduct().getProductsFromFirestore();
      for (var product in productsSnapshot) {
        _products
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
