import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routes/app_routes.dart';
import 'cart/controllers/cart_controller.dart';
import 'category/views/category_screen.dart';
import 'favorites/views/favorites_screen.dart';
import 'home/views/home_screen.dart';
import 'settings/views/settings_screen.dart';

class MainController extends GetxController {
  final cartController = Get.find<CartController>();

  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  var title = [
    "Asroo Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            Obx(
              () => Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                 controller. cartController.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.cartScreen),
                  icon: Image.asset('assets/images/shop.png'),
                ),
              ),
            ),
          ],
          backgroundColor: Get.isDarkMode
              ? Get.theme.colorScheme.background
              : Get.theme.colorScheme.primary,
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.theme.colorScheme.background,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.theme.colorScheme.primary,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.theme.colorScheme.primary,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.theme.colorScheme.primary,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.theme.colorScheme.primary,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: '',
            ),
          ],
          onTap: (index) => controller.currentIndex.value = index,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
        ),
      ),
    );
  }
}
