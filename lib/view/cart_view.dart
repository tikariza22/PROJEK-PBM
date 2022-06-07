import 'package:apoticare/controller/cart_view_controller.dart';
import 'package:apoticare/view/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widget/custom_text.dart';
import './widget/custom_buttom.dart';
import 'checkout_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) => Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        height: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 140,
                              child: Image.network(
                                controller.cartProducts[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: controller.cartProducts[index].name,
                                  ),
                                  CustomText(
                                    text:
                                        '${controller.cartProducts[index].price.toString()}',
                                  ),
                                  Container(
                                    width: 140,
                                    color: Colors.grey,
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
                                child: Icon(Icons.delete),
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
            padding: const EdgeInsets.all(8.0),
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
                    GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder: (controller) => CustomText(
                              text: '${controller.totalPrice}',
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
