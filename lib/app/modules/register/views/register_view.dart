import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
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
              height: 8,
            ),
            const Text(
              "Username",
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
              height: 8,
            ),
            const Text("Email"),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Password"),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Daftar"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xff38B0A9),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 5,
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
