import 'package:get/get.dart';

import '../../product/controllers/product_controller.dart';
import '../../product/models/product_models.dart';

class CartController extends GetxController {
  final productController = Get.find<ProductController>();

  var productsCart = {}.obs;

  get productSubTotal =>
      productsCart.entries.map((e) => e.key.price * e.value).toList();

  get total => productsCart.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int get quantity => productsCart.isEmpty
      ? 0
      : productsCart.entries
      .map((e) => e.value)
      .toList()
      .reduce((value, element) => value + element);

  void addProductToCart(ProductModels product) {
    if (productsCart.containsKey(product)) {
      productsCart[product] += 1;
    } else {
      productsCart[product] = 1;
    }
  }

  void removeProductsFarmCart(ProductModels product) {
    if (productsCart.containsKey(product) && productsCart[product] == 1) {
      productsCart.removeWhere((key, value) => key == product);
    } else {
      productsCart[product] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) =>
      productsCart.removeWhere((key, value) => key == productModels);


}
