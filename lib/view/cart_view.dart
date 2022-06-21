import 'package:apoticare/controller/cart_view_controller.dart';
import 'package:apoticare/view/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widget/custom_text.dart';
import './widget/custom_buttom.dart';
import 'checkout_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'KERANJANG',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewController>(
              init: Get.put(CartViewController()),
              builder: (controller) => Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        height: 140.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 140.h,
                              child: Image.network(
                                controller.cartProducts[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.cartProducts[index].name,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                  CustomText(
                                    text:
                                        'Rp. ${controller.cartProducts[index].price.toString()}',
                                  ),
                                  Container(
                                    width: 140,
                                    color: Color.fromARGB(255, 218, 218, 218),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.increaseQuantity(index);
                                          },
                                          child: Container(
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          alignment: Alignment.center,
                                          text: controller
                                              .cartProducts[index].quantity
                                              .toString(),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.decreaseQuantity(index);
                                          },
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Icon(Icons.minimize),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.removeProduct(
                                    controller.cartProducts[index].productId);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ));
                  },
                  itemCount: controller.cartProducts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 14,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "Total",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GetBuilder<CartViewController>(
                        init: Get.find(),
                        builder: (controller) => CustomText(
                              text: 'Rp. ${controller.totalPrice}',
                            ))
                  ],
                ),
                CustomButton(
                  "Checkout",
                  () {
                    Get.to(() => CheckoutView());
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
