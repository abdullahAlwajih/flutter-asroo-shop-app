import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/text_utils.dart';
import '../../../cart/controllers/cart_controller.dart';
import '../../../user/controllers/auth_controller.dart';
import '../../controllers/payment_controller.dart';

class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PayMentMethodWidget> createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  final payMentController = Get.find<PaymentController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Paypal",
              image: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.removeGooglePay();
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Google Pay",
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.makeGooglePay(
                  amount: cartController.total.toString(),
                  label: authController.displayUserName.value,
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Credit Card",
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.removeGooglePay();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith(
                (states) => Get.theme.colorScheme.primary),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
