import 'package:get/get.dart';
import 'package:my_prod_test/main/repository/user_repository.dart';

import '../../main/models/user_model.dart';
import '../../ui/pages/login/presenter.dart';

class GetXLoginPresenter extends GetxController implements ILoginPresenter {
  final RxString _findUSer = "".obs;
  @override
  String get findUser => _findUSer.value;
  @override
  set findUser(String value) => _findUSer.value = value;
  
  final Rx<UserModel?> _user = Rx(null);
  @override
  UserModel? get user => _user.value;
  @override
  set user(UserModel? value) => _user.value = value;
  
  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    final UserRepository userRepository = UserRepository();
    return userRepository.getUserInfo(findUser);
  }
}
