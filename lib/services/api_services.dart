import 'dart:convert';

import 'package:bestin_interview/model/Model.dart';
import 'package:bestin_interview/model/User.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<List<User>> getUsers({int perPage = 6, int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/users?per_page=$perPage&page=$page'));

    if (response.statusCode == 200) {
      UserList data = UserList.fromJson(json.decode(response.body));
      // final data = json.decode(response.body);
      // final List<dynamic> userList = data['data'];
      return data.data;
      //return userList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
