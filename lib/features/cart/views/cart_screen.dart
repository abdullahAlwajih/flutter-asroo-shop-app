import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'components/cart_product_card.dart';
import 'components/cart_total.dart';
import 'components/clear_cart_dialog.dart';
import 'components/empty_cart.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        elevation: 0,
        backgroundColor: Get.isDarkMode
            ? Get.theme.colorScheme.background
            : Get.theme.colorScheme.primary,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => clearCartDialog(),
            icon: const Icon(Icons.backspace),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.productsCart.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) => CartProductCard(
                          index: index,
                        ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: controller.productsCart.length,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
