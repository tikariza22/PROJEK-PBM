import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Container(
          child: Column(children: [
            Container(
              child: Image.asset("assets/examples1.png"),
            ),
            Text("Bodrex Extra"),
            Text("150 ml bose"),
            Row(
              children: [
                Text("Rp. 150.000"),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Color(0xff38B0A9),
                    ))
              ],
            )
          ]),
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
      ],
    );
  }
}
