import 'package:apoticare/model/user_model.dart';
import 'package:apoticare/services/flutter_user.dart';
import 'package:apoticare/view/control_view.dart';
import 'package:apoticare/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../services/local_storage.dart';

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
          .then((value) {
        FireStoreUser().getUserFromFirestore(value.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      Get.offAll(() => ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login.. sing in',
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
        saveUserLocal(UserModel(
          userId: user.user!.uid,
          email: user.user!.email!,
          name: name!,
          pic: '',
        ));
      });
      Get.offAll(() => ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..regis',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      print(error);
    }
  }

  void saveUserLocal(UserModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }
}
