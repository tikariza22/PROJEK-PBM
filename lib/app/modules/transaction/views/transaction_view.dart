import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => const ItemTransaction(),
        ),
      ),
    );
  }
}

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/exam2.png",
        width: 70,
      ),
      title: const Text(
        "Bodrex Migra",
      ),
      subtitle: const Text(
        "12-Sept-2022" "\n sukses",
      ),
    );
  }
}
