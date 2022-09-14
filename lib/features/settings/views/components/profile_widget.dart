import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/text_utils.dart';
import '../../../user/controllers/auth_controller.dart';

class ProfileWidget extends GetView<AuthController> {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(controller.displayUserPhoto.value),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text:
                    controller.capitalize(controller.displayUserName.value),
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: controller.displayUserEmail.value,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
