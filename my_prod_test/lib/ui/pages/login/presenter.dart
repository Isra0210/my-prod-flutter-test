import 'package:my_prod_test/main/models/user_model.dart';

abstract class ILoginPresenter {
  String get findUser;
  set findUser(String value);
  
  UserModel? get user;
  set user(UserModel? value);
  
  Future<Map<String, dynamic>> getUserInfo();
}