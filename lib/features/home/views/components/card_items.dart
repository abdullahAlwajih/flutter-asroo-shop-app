import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/text_utils.dart';
import '../../../cart/controllers/cart_controller.dart';
import '../../../product/models/product_models.dart';
import '../../../product/views/product_details_scree.dart';

class CardItems extends GetView<CartController> {
  const CardItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
          child: controller.productController.searchList.isEmpty &&
                  controller
                      .productController.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empry_light.png")
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: controller.productController.searchList.isEmpty
                      ? controller.productController.products.length
                      : controller.productController.searchList.length,
                  itemBuilder: (context, index) {
                    if (controller.productController.searchList.isEmpty) {
                      return buildCardItems(
                          product: controller.productController.products[index],
                          onTap: () => Get.to(() => ProductDetailsScreen(
                                productModels: controller
                                    .productController.products[index],
                              )));
                    } else {
                      return buildCardItems(
                          product:
                              controller.productController.searchList[index],
                          onTap: () => Get.to(() => ProductDetailsScreen(
                                productModels: controller
                                    .productController.searchList[index],
                              )));
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required ProductModels product,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.theme.colorScheme.surface,
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
                      onPressed: () => controller
                          .productController.favoritesController
                          .manageFavourites(product),
                      icon: controller.productController.favoritesController
                              .isFavourites(product.id)
                          ? Icon(Icons.favorite,
                              color: Get.theme.colorScheme.error)
                          : Icon(Icons.favorite_outline,
                              color: Get.theme.colorScheme.onSurface),
                    ),
                    IconButton(
                      onPressed: () => controller.addProductToCart(product),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(product.image, fit: BoxFit.fitHeight),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            text: "${product.rating.rate}",
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                          const Icon(Icons.star, size: 12, color: Colors.white),
                        ],
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
}
