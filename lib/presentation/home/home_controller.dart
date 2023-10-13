import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

import '../../backend/models/banners_model.dart';
import '../../backend/models/popular_product_model.dart';
import '../../backend/services/firebase_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    _fetchBanners();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
   late List<PopularProductModel> popularProductData;

  void _fetchPopularProducts() async {
    "START FETCHING Popular Product ".bgGreenConsole;

    try {
      popularProductData = (await FirebaseServices.fetchPopularProduct())!;

    } catch (e) {
      e.toString().redConsole;
    } finally {
      _isLoading.value = false;
      update();
    }
    _fetchBestSellingProducts();
  }


  void _fetchBestSellingProducts() {}


  void goToDetailsScreen(PopularProductModel data) {
    // routing and set data for next screen
  }
}
