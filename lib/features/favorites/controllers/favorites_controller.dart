import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../product/models/product_models.dart';

class FavoriteController extends GetxController {
  var favouritesList = RxList<ProductModels>([]);
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    List? storedShopping = storage.read<List>('isFavouritesList');

    if (storedShopping != null) {
      favouritesList =
          storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
  }
  // Logic for Favourites Screen
  void manageFavourites(ProductModels product) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == product.id);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouritesList.add(product);
      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) =>
      favouritesList.any((element) => element.id == productId);
}
