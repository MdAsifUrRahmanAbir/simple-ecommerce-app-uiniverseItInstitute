import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/models/product_model.dart';
import '../../../common_widget/appbar_widget/appbar_widget.dart';
import '../../../common_widget/appbar_widget/home_appbar_widget.dart';
import '../../../common_widget/loading_widget.dart';
import '../../../common_widget/text_labels/title_heading3_widget.dart';
import '../../../common_widget/text_labels/title_heading4_widget.dart';
import '../../../common_widget/text_labels/title_heading5_widget.dart';
import '../../../utils/strings.dart';
import '../widgets/accesories_products_widget.dart';
import '../widgets/banner_widget.dart';
import '../home_controller.dart';
import '../widgets/fashion_products_widget.dart';
import '../widgets/flashSale_products_widget.dart';
import '../widgets/popular_products_widget.dart';
import '../widgets/shoes_products_widget.dart';
import '../widgets/watch_products_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
        context: context,
        controller: controller,
      ),
      body: Obx(() => controller.isLoading
          ? const Center(
              child: CustomLoadingWidget(),
            )
          : ListView(
              padding: const EdgeInsets.all(18),
              physics: const BouncingScrollPhysics(),
              children: [
                BannerWidget(bannerImages: controller.bannerData),
                const SizedBox(height: 20),
                PopularProducts(
                  controller: controller,
                ),
                FlashSaleProducts(
                  controller: controller,
                ),
                FashionProducts(
                  controller: controller,
                ),
                AccessoriesProducts(
                  controller: controller,
                ),

                ShoesProducts(
                  controller: controller,
                ),
                WatchProducts(
                  controller: controller,
                ),


              ],
            )),
    );
  }
}
