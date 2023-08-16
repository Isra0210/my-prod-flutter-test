import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:my_prod_test/presentation/home/home_binding.dart';
import 'package:my_prod_test/ui/pages/login/login_page.dart';

import 'main/routes/routes.dart';
import 'ui/theme/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: AppTheme().makeAppTheme(),
        debugShowCheckedModeBanner: false,
        title: 'My prod',
        initialBinding: HomeBinding(),
        initialRoute: LoginPage.route,
        getPages: makeRoutes(),
        onInit: () {
          FlutterNativeSplash.remove();
        },
      ),
    );
  }
}
