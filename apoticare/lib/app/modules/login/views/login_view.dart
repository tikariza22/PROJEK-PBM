import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.7,
              height: Get.width * 0.7,
              child: Image.asset("assets/ilus.png", fit: BoxFit.contain,),
            ),
            SizedBox(height: 30,),
            Text(
              "Selamat datang",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.normal,
                color: Color(0xff38B0A9), 
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
              textAlign: TextAlign.center,
              style: TextStyle(
              ),
            ),
            SizedBox(height: 70,),
            Container(
              width: Get.width * 0.7,
              child: ElevatedButton(
                onPressed: (){}, 
                child: Text("Daftar Akun"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Color(0xff38B0A9),
                  padding: EdgeInsets.symmetric(
                    vertical: 15
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: Get.width *0.7,
              child: ElevatedButton(
                onPressed: (){}, 
                child: Text(
                  "Login", 
                  style: TextStyle(
                    color:Color(0xff38B0A9)
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 2, color: Color(0xff38B0A9)),
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
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
