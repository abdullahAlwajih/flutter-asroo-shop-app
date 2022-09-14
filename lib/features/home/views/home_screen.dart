import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/text_utils.dart';
import 'components/card_items.dart';
import 'components/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Get.theme.colorScheme.background
                : Get.theme.colorScheme.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: "Find Your",
                color: Colors.white,
              ),
              SizedBox(height: 5),
              TextUtils(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                text: "INSPIRATION",
                color: Colors.white,
              ),
              SizedBox(height: 20),
              SearchFormText(),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              text: "Categories",
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30),
        const CardItems(),
      ],
    );
  }
}
