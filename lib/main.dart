import 'package:flutterbyte/app_setup.dart';
import 'package:flutterbyte/common_libs.dart';

void main() async {
  await initializeApplication();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Get.find<RouterController>().router;
    return GetMaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return const Locale('en');
      },
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: context.lightTheme,
    );
  }
}
