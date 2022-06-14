import 'package:apoticare/controller/auth_view_controller.dart';
import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class WelcomeView extends GetWidget<AuthViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              height: Get.width * 0.7,
              child: Image.asset(
                "assets/ilus.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Color(0xff38B0A9),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RegisterView());
                },
                child: const Text("Daftar Akun"),
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
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xff38B0A9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(width: 2, color: Color(0xff38B0A9)),
                    )),
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
      ),
    );
  }
}
