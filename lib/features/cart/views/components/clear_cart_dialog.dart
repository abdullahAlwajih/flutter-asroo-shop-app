import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../controllers/cart_controller.dart';

void clearCartDialog() {
  Get.defaultDialog(
    title: "Clean Products",
    titleStyle: const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    middleText: 'Are you sure you need clear products',
    middleTextStyle: const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.grey,
    radius: 10,
    textCancel: " No ",
    cancelTextColor: Colors.white,
    textConfirm: " YES ",
    confirmTextColor: Colors.white,
    onCancel: () => Get.toNamed(AppRoutes.cartScreen),
    onConfirm: () {
      Get.find<CartController>().productsCart.clear();
      Get.back();
    },
    buttonColor: Get.theme.colorScheme.primary,
  );
}