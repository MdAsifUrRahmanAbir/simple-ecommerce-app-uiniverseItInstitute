import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

import '../../backend/models/banners_model.dart';
import '../../backend/models/product_model.dart';
import '../../backend/services/firebase_service.dart';
import '../../routes/routes.dart';
import 'subs_screens/all_products/all_products_screen.dart';
import 'subs_screens/products_view/product_view_screen.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    _fetchBanners();
    super.onInit();
  }


  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  /// fetching banners
  late List<BannerModel> bannerData;
  void _fetchBanners() async {
    _isLoading.value = true;
    update();
    "START FETCHING BANNER ".bgGreenConsole;

    try {
      bannerData = (await FirebaseServices.fetchBanner())!;

      bannerData.toString().yellowConsole;
      _fetchPopularProducts();
    } catch (e) {
      e.toString().redConsole;
    } finally {
      // _isLoading.value = false;
      // update();
    }
  }


  /// fetching popular products
  late List<ProductModel> popularProductData;
  void _fetchPopularProducts() async {
    "START FETCHING Popular Product ".bgGreenConsole;

    try {
      popularProductData = (await FirebaseServices.fetchPopularProduct())!;
      _fetchBestSellingProducts();
    } catch (e) {
      e.toString().redConsole;
    } finally {
      // _isLoading.value = false;
      // update();
    }
    _fetchBestSellingProducts();
  }


  /// fetching best selling products
  late List<ProductModel> bestSellingProductData;
  void _fetchBestSellingProducts() {



    _isLoading.value = false;
    update();
  }




  /// routing functions with pass data
  void goToDetailsScreen(ProductModel data, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductView(
                  products: data,
                )));
  }

  void seeAllPopularProducts(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AllProductsScreen(
              products: popularProductData,
              appTitle: "All Popular Products",
            )));
  }

  void goToCartScreen() {
    Get.toNamed(Routes.cartScreen);
  }
}
