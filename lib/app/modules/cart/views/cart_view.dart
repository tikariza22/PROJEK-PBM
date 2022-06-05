import 'package:apoticare/app/modules/transaction/views/transaction_view.dart';
import 'package:apoticare/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            'Keranjang',
            style: TextStyle(
              color: Color(0xff38B0A9),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/exam2.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Expanded(child: Text("Bodrex Migra")),
                        IconButton(
                            onPressed: () {
                              controller.decrement();
                            },
                            icon: const Icon(Icons.remove_circle)),
                        Obx(() => Text("${controller.count.value}")),
                        IconButton(
                            onPressed: () {
                              controller.increment();
                            },
                            icon: const Icon(Icons.add_circle)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Material(
              elevation: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                height: 84,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("TOTAL"),
                        Text("15.000"),
                      ],
                    ),
                    SizedBox(
                        height: 50,
                        width: 146,
                        child: ElevatedButton(
                          child: const Text("CHECKOUT"),
                          onPressed: () {
                            Get.toNamed(Routes.TRANSACTION);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xff38B0A9),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        )

        // Padding(
        //   padding: EdgeInsets.all(13),
        //   child: Row(
        //     children: [
        //       Container(
        //         height: 100,
        //         width: 100,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: AssetImage("assets/exam2.png"), fit: BoxFit.cover),
        //         ),
        //       ),
        //       Expanded(child: Text("Bodrex Migra")),
        //       IconButton(
        //           onPressed: () {
        //             controller.decrement();
        //           },
        //           icon: Icon(Icons.remove_circle)),
        //       Obx(() => Text("${controller.count.value}")),
        //       IconButton(
        //           onPressed: () {
        //             controller.increment();
        //           },
        //           icon: Icon(Icons.add_circle)),
        //     ],
        //   ),
        // ),
        );
  }
}
