import 'package:apoticare/view/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import './widget/text_form_field.dart';
import './widget/custom_buttom.dart';
import './widget/custom_text.dart';

class LoginView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Login Page',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Selamat datang",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color(0xff38B0A9),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "silahkan masuk akun terlebih dahulu.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 100,
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
                  'SIGN IN',
                  () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      controller.signInWithEmailAndPassword();
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
