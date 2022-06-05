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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                  image: const DecorationImage(
                      image: AssetImage('assets/profil.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Nama",
              textAlign: TextAlign.left,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Fiki Aviantono",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email",
              textAlign: TextAlign.left,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "fiki@mail.unej.ac.id",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Password",
              textAlign: TextAlign.left,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "***********",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: Get.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Update"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xff42A2FC),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: Get.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xffB03838),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "For More Information :",
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.3,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Feedback"),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xff38B0A9),
                    padding: const EdgeInsets.symmetric(vertical: 15),
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
