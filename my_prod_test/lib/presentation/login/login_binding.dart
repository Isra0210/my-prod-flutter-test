import 'package:get/get.dart';

import '../../ui/pages/login/presenter.dart';
import 'getx_login_presenter.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ILoginPresenter>(GetXLoginPresenter());
  }
}
