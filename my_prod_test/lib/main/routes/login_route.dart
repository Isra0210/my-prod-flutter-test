import 'package:get/get.dart';

import '../../presentation/login/login_binding.dart';
import '../../ui/pages/login/login_page.dart';

GetPage makeLoginRoute() => GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    );
