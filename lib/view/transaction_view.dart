import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/checkout_controller.dart';
import './widget/custom_text.dart';

class TransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CheckoutViewController>(
              init: CheckoutViewController(),
              builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.h),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: controller.checkouts[index].date,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: 'Pesanan Terkirim',
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              CustomText(
                                text: controller.checkouts[index].name,
                              ),
                              CustomText(
                                text: controller.checkouts[index].address,
                              ),
                              CustomText(
                                text: controller.checkouts[index].phone,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Total Harga',
                                    color: Colors.green,
                                  ),
                                  CustomText(
                                    text:
                                        'Rp. ${controller.checkouts[index].totalPrice}',
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.checkouts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
