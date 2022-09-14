import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/styles/app_themes.dart';
import '../../../../core/widgets/text_utils.dart';
import '../../controllers/settings_controller.dart';

class DarkModeWidget extends GetView<SettingController> {
  const DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor:Get.theme.colorScheme.primary,
            activeColor:  Get.theme.colorScheme.primary,
            value: controller.swithchValue.value,
            onChanged: (value) {
              controller.changeTheme();
              controller.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text:  AppLocalizations.of(Get.context!)!.darkMode,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
