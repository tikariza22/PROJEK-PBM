import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: Color(0xff38B0A9),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/exam2.png"), fit: BoxFit.cover),
              ),
            ),
            Expanded(child: Text("Bodrex Migra")),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
            Text("20"),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
          ],
        ),
      ),
    );
  }
}
