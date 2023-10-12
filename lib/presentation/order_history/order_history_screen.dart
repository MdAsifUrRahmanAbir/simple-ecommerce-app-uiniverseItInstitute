import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/common_widget/text_labels/title_heading3_widget.dart';

import '../../backend/models/order_model.dart';
import '../../common_widget/text_labels/title_heading2_widget.dart';
import '../../common_widget/text_labels/title_heading4_widget.dart';
import '../../common_widget/text_labels/title_heading5_widget.dart';
import '../../utils/assets_path.dart';
import 'order_history_controller.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});

  final controller = Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              OrderModel data = orders[index];
              return ListTile(
                enabled: true,
                dense: true,
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                        Assets.productPlaceHolder,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    )),
                title: Row(
                  children: [
                    TitleHeading2Widget(text: data.productName),
                    const SizedBox(width: 20,),
                    TitleHeading4Widget(text: "Order ID: ${ data.orderId}", opacity: .8),
                  ],
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleHeading3Widget(text: "Product ID: ${data.productId}"),
                    TitleHeading4Widget(text: data.customerAddress, opacity: .8),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TitleHeading4Widget(
                      text: data.productPrice,
                    ),
                    TitleHeading3Widget(
                      text: "STATUS: ${data.orderStatus}",
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, i) => const SizedBox(height: 10),
            itemCount: orders.length));
  }
}
