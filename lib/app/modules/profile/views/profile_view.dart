import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: 250,
              height: 240,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4.0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/profil.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Nama",
              textAlign: TextAlign.left,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Fiki Aviantono",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email",
              textAlign: TextAlign.left,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "fiki@mail.unej.ac.id",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password",
              textAlign: TextAlign.left,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "***********",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Get.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xff42A2FC),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: Get.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Logout"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xffB03838),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "For More Information :",
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width * 0.3,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Feedback"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xff38B0A9),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
