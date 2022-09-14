import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_flutter/super_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/routes/app_pages.dart';
import 'core/services/app_services.dart';
import 'core/styles/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: AppStorage.getThemeMode,
      localizationsDelegates: const [
        SuperTranslations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppPages.mainSreen
          : AppPages.welcome,
      getPages: AppPages.pages,
    );
  }
}
