import 'package:flutter/services.dart';
import 'package:flutterbyte/common_libs.dart';

initializeApplication() async {
  _initializeControlllers();
  await _initializeWindow();
}

_initializeControlllers() {
  Get.put(RouterController(), permanent: true);
}

_initializeWindow() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
