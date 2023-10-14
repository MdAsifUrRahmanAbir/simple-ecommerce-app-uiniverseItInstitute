import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../backend/models/product_model.dart';
import '../../../../common_widget/appbar_widget/appbar_widget.dart';
import '../../../../common_widget/text_labels/title_heading2_widget.dart';
import '../../../../common_widget/text_labels/title_heading3_widget.dart';
import '../../../../utils/assets_path.dart';
import '../../../../utils/strings.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 10,),
          Text(Strings.productDetails,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text(products.description),
          const SizedBox(height: 10,),
          Row(
            children: [
              TitleHeading3Widget(text: Strings.productPrice),
              TitleHeading3Widget(
                text: products.haveDiscount
                    ? "${products.discountPrice.toStringAsFixed(2)} ${products.currency}"
                    : "${products.price.toStringAsFixed(2)} ${products.currency}",
                color: Colors.black87,
              ),
            ],
          ),




        ],
      ),
    );
  }
}
