import 'package:get/get.dart';
import 'package:my_prod_test/presentation/login/login_binding.dart';
import '../../presentation/home/home_binding.dart';
import '../../ui/pages/home/home_page.dart';

GetPage makeHomeRoute() => GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: HomeBinding(),
      bindings: [
        LoginBinding(),
      ],
    );
