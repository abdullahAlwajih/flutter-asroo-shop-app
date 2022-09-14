import 'package:get/get.dart';

import '../../features/cart/views/cart_screen.dart';
import '../../features/main_feature.dart';
import '../../features/payment/views/payment_screen.dart';
import '../../features/splash/views/welcome_screen.dart';
import '../../features/user/views/forgot_password_screen.dart';
import '../../features/user/views/login_screen.dart';
import '../../features/user/views/signup_screen.dart';
import 'app_bindings.dart';
import 'app_routes.dart';

abstract class AppPages {
  //initialRoute

  static const welcome = AppRoutes.welcomeScreen;
  static const mainSreen = AppRoutes.mainScreen;

  //getPages

  static final pages = [
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      bindings: [
        AuthBinding(),
        FavoriteBinding(),
        ProductBinding(),
        CartBinding(),
        CategoryBinding(),
        SettingBinding(),
        MainBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => const CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.paymentScreen,
      page: () => const PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
        PaymentBinding(),
      ],
    ),
  ];
}
