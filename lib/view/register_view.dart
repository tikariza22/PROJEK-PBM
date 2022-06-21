import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:apoticare/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controller/auth_view_controller.dart';

import '../view/widget/custom_buttom.dart';
import '../view/widget/text_form_field.dart';

class RegisterView extends GetWidget<AuthViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          padding: EdgeInsets.all(30.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(
                  text: "Buat Akun Baru",
                  fontSize: 32,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff38B0A9),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: "Silahkan Membuat Akun Baru Anda",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 80.h,
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
                SizedBox(
                  height: 10.h,
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
                SizedBox(
                  height: 10.h,
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
                SizedBox(
                  height: 80.h,
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
                SizedBox(
                  height: 20.h,
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
