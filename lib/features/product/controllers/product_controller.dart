import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../favorites/controllers/favorites_controller.dart';
import '../models/product_models.dart';
import 'product_services.dart';

class ProductController extends GetxController {
  FavoriteController favoritesController = Get.find();

  var products = RxList<ProductModels>([]);
  var isLoading = RxBool(true);

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) products.addAll(products);
    } finally {
      isLoading(false);
    }
  }

  /// Search Bar Logic
  void addSearchToList(String searchName) {
    searchList.value = products
        .where((search) =>
            search.title.toLowerCase().contains(searchName.toLowerCase()) ||
            search.price
                .toString()
                .toLowerCase()
                .contains(searchName.toLowerCase()))
        .toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
