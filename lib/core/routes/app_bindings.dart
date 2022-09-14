import 'package:get/get.dart';

import '../../features/cart/controllers/cart_controller.dart';
import '../../features/category/controllers/category_controller.dart';
import '../../features/favorites/controllers/favorites_controller.dart';
import '../../features/main_feature.dart';
import '../../features/payment/controllers/payment_controller.dart';
import '../../features/product/controllers/product_controller.dart';
import '../../features/settings/controllers/settings_controller.dart';
import '../../features/user/controllers/auth_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController(), permanent: true);
  }
}

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}


