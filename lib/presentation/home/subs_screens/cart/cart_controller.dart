import 'package:get/get.dart';

import '../../../../backend/local_storage.dart';
import '../../../../backend/models/product_model.dart';

class CartController extends GetxController{

  late List<ProductModel> products;

  @override
  void onInit() {
    products = LocalStorage.currentCart();
    _productsPriceManage(products);
    super.onInit();
  }

  double subTotal = 0;
  double deliveryCharge = 50;
  void _productsPriceManage(List<ProductModel> products) {
    for (var element in products) {
      if(element.haveDiscount){
        subTotal += element.discountPrice;
      }else{
        subTotal += element.price;
      }

    }
  }
}