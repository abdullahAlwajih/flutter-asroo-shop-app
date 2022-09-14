import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/models/product_models.dart';
import '../../controllers/cart_controller.dart';

class CartProductCard extends GetView<CartController> {
  final int index;

  const CartProductCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductModels product = controller.productsCart.keys.toList()[index];
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Get.theme.colorScheme.primary.withOpacity(0.7)
            : Get.theme.colorScheme.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => controller.removeProductsFarmCart(product),
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Obx(() => Text(
                      "${controller.productsCart.values.toList()[index]}",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  IconButton(
                    onPressed: () => controller.addProductToCart(product),
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => controller.removeOneProduct(product),
                icon: Icon(Icons.delete,
                    size: 20,
                    color: Get.isDarkMode ? Colors.black : Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
