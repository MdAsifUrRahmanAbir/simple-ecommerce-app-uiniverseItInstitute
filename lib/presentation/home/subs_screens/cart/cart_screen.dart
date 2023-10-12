import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/common_widget/text_labels/title_heading1_widget.dart';

import '../../../../common_widget/appbar_widget/appbar_widget.dart';
import 'cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: "Cart",
        context: context,
        onBackClick: () => Get.back(),
      ),

      body: const Column(
        children: [
          TitleHeading1Widget(text: "Cart Screen Show From Local Storage")
        ],
      ),
    );
  }
}
