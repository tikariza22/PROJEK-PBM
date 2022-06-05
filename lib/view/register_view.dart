import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import '../view/widget/custom_buttom.dart';
import '../view/widget/text_form_field.dart';

class RegisterView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Register Page',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.off(() => WelcomeView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Buat Akun Baru",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color(0xff38B0A9),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Silahkan Membuat Akun Baru",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomTextFormField(
                  title: 'Nama',
                  hintText: 'John Doe',
                  keyboardType: TextInputType.emailAddress,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Email invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.name = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  title: 'Email',
                  hintText: 'fiki@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Email invalid or not found';
                  },
                  onSavedFn: (value) {
                    controller.email = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  title: 'Password',
                  hintText: '***********',
                  obscureText: true,
                  validatorFn: (value) {
                    if (value!.isEmpty) return 'Password is incorrect';
                  },
                  onSavedFn: (value) {
                    controller.password = value;
                  },
                ),
                const SizedBox(
                  height: 120,
                ),
                CustomButton(
                  'REGISTER',
                  () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      controller.registerWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Apoticare @2022",
                  style: TextStyle(
                    color: Color(0xff38B0A9),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
