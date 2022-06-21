import 'package:apoticare/controller/cart_view_controller.dart';
import 'package:apoticare/model/cart_model.dart';
import 'package:apoticare/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './widget/custom_text.dart';
import './widget/custom_buttom.dart';

class DetailView extends StatelessWidget {
  ProductModel model;
  DetailView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Detail Produk',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.h),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: model.name,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: "Description",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomText(
                text: model.description,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: "Benefits",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomText(
                text: model.benefits,
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  CustomText(
                    text: 'Rp. ${model.price}',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GetBuilder<CartViewController>(
                    init: CartViewController(),
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
