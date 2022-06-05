import 'package:apoticare/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Selamat datang",
                style: TextStyle(fontSize: 30, color: Color(0xff38B0A9)),
              ),
              const Text(
                "silahkan masuk akun terlebih dahulu.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Email",
                textAlign: TextAlign.left,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Password"),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: Get.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xff38B0A9),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Apoticare @2022",
                style: TextStyle(
                  color: Color(0xff38B0A9),
                ),
              )
            ],
          ),
        ));
  }
}
