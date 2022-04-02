import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
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
            SizedBox(
              height: 40,
            ),
            Text(
              "Selamat datang",
              style: TextStyle(fontSize: 50, color: Color(0xff38B0A9)),
            ),
            Text(
              "silahkan masuk akun terlebih dahulu.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Email",
              textAlign: TextAlign.left,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Email"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Password"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Daftar"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xff38B0A9),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
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
