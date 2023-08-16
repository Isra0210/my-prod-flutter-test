import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_test/presentation/home/home_binding.dart';
import 'package:my_prod_test/ui/pages/home/home_page.dart';
import 'package:my_prod_test/ui/pages/login/login_page.dart';

import 'main/routes/routes.dart';
import 'ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My prod',
        theme: AppTheme().makeAppTheme(),
        initialBinding: HomeBinding(),
        initialRoute: LoginPage.route,
        getPages: makeRoutes(),
      ),
    );
  }
}
