import 'dart:convert';

import 'package:my_prod_test/main/models/repos_model.dart';
import 'package:my_prod_test/main/utils/constants.dart';
import 'package:http/http.dart' as http;

class GitUserReposRepository {
  Future<List<ReposModel?>> getAllRepos(String userName) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$userName/repos"));
      if (response.statusCode == 200) {
        final decodedList = List.from(jsonDecode(response.body))
            .map((e) => ReposModel.fromJson(e))
            .toList();
        return decodedList;
      }
      if (response.statusCode > 400 && response.statusCode < 500) {
        throw Exception("Repos not found");
      } else {
        throw Exception("Unexpected error");
      }
    } catch (error) {
      throw Exception("$error");
    }
  }

  Future<List<ReposModel?>> getStarredRepos(String userName) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$userName/starred"));
      if (response.statusCode == 200) {
        final decodedList = List.from(jsonDecode(response.body))
            .map((e) => ReposModel.fromJson(e))
            .toList();
        return decodedList;
      }
      if (response.statusCode > 400 && response.statusCode < 500) {
        throw Exception("Repos not found");
      } else {
        throw Exception("Unexpected error");
      }
    } catch (error) {
      throw Exception("$error");
    }
  }
}
