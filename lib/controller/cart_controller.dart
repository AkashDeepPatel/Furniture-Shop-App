import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/Product.dart';

class CartController extends GetxController {
  RxList cartItemList = [].obs;

  addItemtoCart(Product product) {
    cartItemList.add(product);
  }

  removeItemfromCart(int index) {
    cartItemList.removeAt(index);
  }

  int getSubtotalAmount() {
    int total = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      total = total + cartItemList[i].price;
    }
    return total;
  }
}
