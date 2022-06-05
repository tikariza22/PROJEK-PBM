import 'package:apoticare/model/user_model.dart';
import 'package:apoticare/services/flutter_user.dart';
import 'package:apoticare/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthViewController extends GetxController {
  String? email, password, name;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user?.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        print(user);
        Get.offAll(() => HomeView());
      });
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

  void registerWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
        ));
      });
      Get.offAll(() => HomeView());
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
