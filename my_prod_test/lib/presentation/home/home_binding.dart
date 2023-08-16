import 'package:get/get.dart';
import 'package:my_prod_test/presentation/home/getx_home_presenter.dart';
import 'package:my_prod_test/ui/pages/home/presenter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomePresenter>(GetXHomePresenter());
  }
}
