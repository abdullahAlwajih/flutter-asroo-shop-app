import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/text_utils.dart';
import '../../../product/models/product_models.dart';
import '../../../product/views/product_details_scree.dart';
import '../../controllers/category_controller.dart';

class CategoryItems extends GetView<CategoryController> {
  final String categoryTitle;

  const CategoryItems({required this.categoryTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode
            ? Get.theme.colorScheme.background
            : Get.theme.colorScheme.primary,
      ),
      body: Obx(() {
        if (controller.isAllCategory.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            itemCount: controller.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  product: controller.categoryList[index],
                  onTap: () => Get.to(() => ProductDetailsScreen(
                      productModels: controller.categoryList[index])));
            },
          );
        }
      }),
    );
  }

  Widget buildCardItems({
    required ProductModels product,
    required Function() onTap,
  }) =>
      Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => controller.cartController
                            .productController.favoritesController
                            .manageFavourites(product),
                        icon: controller.cartController.productController
                                .favoritesController
                                .isFavourites(product.id)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_outline,
                                color: Colors.black),
                      ),
                      IconButton(
                          onPressed: () => controller.cartController
                              .addProductToCart(product),
                          icon: const Icon(Icons.shopping_cart,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(product.image, fit: BoxFit.fitHeight),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${product.price}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  text: "${product.rating.rate}",
                                  color: Colors.white,
                                  underLine: TextDecoration.none),
                              const Icon(Icons.star,
                                  size: 13, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
