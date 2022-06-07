import 'package:apoticare/controller/cart_view_controller.dart';
import 'package:apoticare/model/cart_model.dart';
import 'package:apoticare/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './widget/custom_text.dart';
import './widget/custom_buttom.dart';

class DetailView extends StatelessWidget {
  ProductModel model;
  DetailView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: model.name,
                fontSize: 30,
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Deskripsi",
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: model.description,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  CustomText(
                    text: model.price,
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      child: CustomButton("Tambahkan", () {
                        controller.addProduct(CartModel(
                          name: model.name,
                          image: model.image,
                          price: model.price,
                          productId: model.productId,
                        ));
                      }),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
