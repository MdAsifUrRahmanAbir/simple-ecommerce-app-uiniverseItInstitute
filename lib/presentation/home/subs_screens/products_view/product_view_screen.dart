import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../backend/models/product_model.dart';
import '../../../../common_widget/appbar_widget/appbar_widget.dart';
import '../../../../utils/assets_path.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appTitle: products.name,
        context: context,
        onBackClick: () => Get.back(),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: FadeInImage(
                placeholder: AssetImage(Assets.productPlaceHolder),
                image: NetworkImage(products.image),
              fit: BoxFit.cover,
            ),
          ),


        ],
      ),
    );
  }
}
