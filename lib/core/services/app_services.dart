import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_flutter/super_flutter.dart';

abstract class AppServices {
  static Future<void> initializeApp() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await GetStorage.init();
    await Firebase.initializeApp();
    await SuperRepository.initialize();
  }
}
