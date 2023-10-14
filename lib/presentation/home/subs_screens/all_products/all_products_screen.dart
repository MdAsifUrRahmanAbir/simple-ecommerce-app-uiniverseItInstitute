import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../backend/models/product_model.dart';
import '../../../../common_widget/appbar_widget/appbar_widget.dart';


class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.products, required this.appTitle});

  final List<ProductModel> products;
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: appTitle,
        context: context,
        onBackClick: () => Get.back(),
      ),

      body: const Column(
        children: [
/// show products in gridview
        ],
      ),
    );
  }
}
