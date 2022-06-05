import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => const ItemCard(),
      ),
    );
    //   return Scaffold(
    //       appBar: AppBar(
    //         title: Text("Home screan"),
    //       ),
    //       body: Center(
    //         child: FlatButton(
    //             child: Text("Logout"),
    //             onPressed: () {
    //               _auth.signOut();
    //               Get.offAll(() => WelcomeView());
    //             }),
    //       ));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(10),
      width: Get.height * 0.1,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: const Color.fromARGB(255, 223, 223, 223), width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 70.2,
            width: 70.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/exam2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            "Bodrex Migra",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Meringankan sakit kepala"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Rp. 10.000"),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.add_circle_rounded))
            ],
          )
        ],
      ),
    );
  }
}
