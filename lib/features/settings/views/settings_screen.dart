import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../core/widgets/text_utils.dart';
import 'components/dark_mode_widget.dart';
import 'components/language_widget.dart';
import 'components/logout_widget.dart';
import 'components/profile_widget.dart';

class SettingsScreen extends GetView {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const ProfileWidget(),
        const SizedBox(height: 10),
        Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey, thickness: 2),
        const SizedBox(height: 20),
        TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          text: AppLocalizations.of(context)!.general,
          color: Get.theme.colorScheme.primary,
          underLine: TextDecoration.none,
        ),
        const SizedBox(height: 20),
        const DarkModeWidget(),
        const SizedBox(height: 20),
        const LanguageWidget(),
        const SizedBox(height: 20),
        const LogOutWidget(),
      ],
    );
  }
}
