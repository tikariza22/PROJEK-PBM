import 'package:apoticare/view/detail_view.dart';
import 'package:apoticare/view/loginview.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './widget/custom_text.dart';

import '../controller/home_view_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewController>(
        init: Get.find<HomeViewController>(),
        builder: (controller) => SingleChildScrollView(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 16.h, right: 16.w, left: 16.w),
          child: Column(
            children: [ListViewProducts(), ListViewProducts()],
          ),
        ),
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (controller) => Container(
        height: 320.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailView(model: controller.products[index]));
              },
              child: Container(
                width: 164.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.white,
                      ),
                      height: 240.h,
                      width: 164.w,
                      child: Image.network(
                        controller.products[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomText(
                      text: controller.products[index].name,
                      fontSize: 16,
                    ),
                    CustomText(
                      text: controller.products[index].description,
                      fontSize: 12,
                      color: Colors.grey,
                      maxLines: 1,
                    ),
                    CustomText(
                      text: 'Rp. ${controller.products[index].price}',
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
        ),
      ),
    );
  }
}
