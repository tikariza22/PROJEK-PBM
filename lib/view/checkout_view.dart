import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/cart_view_controller.dart';
import '../controller/checkout_controller.dart';
import './widget/custom_buttom.dart';
import './widget/custom_text.dart';
import './widget/text_form_field.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'CHECKOUT',
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, right: 16.w, left: 16.w, bottom: 24.h),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewModel>(
                    init: CheckoutViewModel(),
                    builder: (controller) => Column(
                      children: [
                        ListViewProducts(),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'nama',
                          hintText: 'coki perdana',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid name.';
                          },
                          onSavedFn: (value) {
                            controller.name = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'addres',
                          hintText: 'jalan tikus no 9',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid addres.';
                          },
                          onSavedFn: (value) {
                            controller.address = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Phone Number',
                          hintText: '+89123456789',
                          keyboardType: TextInputType.phone,
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 10)
                              return 'Please enter valid number.';
                          },
                          onSavedFn: (value) {
                            controller.phone = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        CustomButton(
                          'SUBMIT',
                          () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addCheckoutToFireStore();
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.green,
                                          size: 200.h,
                                        ),
                                        CustomText(
                                          text: 'Order Submitted',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        CustomButton(
                                          'Done',
                                          () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        children: [
          Container(
            height: 160.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.white,
                        ),
                        height: 120.h,
                        width: 120.w,
                        child: Image.network(
                          controller.cartProducts[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(
                        text: controller.cartProducts[index].name,
                        fontSize: 14,
                        maxLines: 1,
                      ),
                      CustomText(
                        text:
                            '\$${controller.cartProducts[index].price} x ${controller.cartProducts[index].quantity}',
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ],
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
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'TOTAL: ',
                fontSize: 14,
                color: Colors.grey,
              ),
              CustomText(
                text: '\$${controller.totalPrice.toString()}',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
