import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => ItemCard(),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(10),
      width: Get.height * 0.2,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: Color.fromARGB(255, 223, 223, 223), width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/exam2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Bodrex Migra",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Meringankan sakit kepala"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Rp. 10.000"),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_rounded))
            ],
          )
        ],
      ),
    );
  }
}
