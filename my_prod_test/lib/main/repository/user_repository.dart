import 'dart:convert';

import 'package:my_prod_test/main/models/user_model.dart';
import 'package:my_prod_test/main/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<Map<String, dynamic>> getUserInfo(String userName) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$userName"));
      if (response.statusCode == 200) {
        return {
          "error": null,
          "data": UserModel.fromJson(jsonDecode(response.body)),
        };
      }
      if (response.statusCode > 400 && response.statusCode < 500) {
        return {"error": "Usuário não encontrado", "data": null};
      } else {
        return {"error": "Algo deu errado", "data": null};
      }
    } catch (error) {
      return {
        "error": "$error",
        "data": null,
      };
    }
  }
}
