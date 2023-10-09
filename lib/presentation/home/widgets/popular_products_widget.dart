import 'package:flutter/material.dart';

import '../../../backend/models/popular_product_model.dart';
import '../../../common_widget/text_labels/title_heading3_widget.dart';
import '../../../common_widget/text_labels/title_heading4_widget.dart';
import '../../../common_widget/text_labels/title_heading5_widget.dart';
import '../home_controller.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleHeading3Widget(
              text: "Popular Products",
            ),

            TextButton(
                onPressed: (){

                },
                child: const Text("See All")
            ),
          ],
        ),
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                PopularProductModel data =
                controller.popularProductData[index];
                return InkWell(
                  onTap: (){
                    controller.goToDetailsScreen(data);
                  },
                  child: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(data.image),
                            fit: BoxFit.fill)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.7)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                TitleHeading4Widget(
                                  text: data.name,
                                  color: Colors.white,
                                ),
                                Column(
                                  children: [
                                    TitleHeading3Widget(
                                      text: data.haveDiscount ?  "${data.discountPrice.toStringAsFixed(2)} ${data.currency}": "${data.price.toStringAsFixed(2)} ${data.currency}",
                                      color: Colors.black87,
                                    ),
                                    Visibility(
                                      visible: data.haveDiscount,
                                        child: Text(
                                          "${data.price.toStringAsFixed(2)} ${data.currency}",
                                          style: const TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: 12.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, i) =>
              const SizedBox(width: 15),
              itemCount: controller.popularProductData.length
              // itemCount: 5
          ),
        )
      ],
    );
  }
}
