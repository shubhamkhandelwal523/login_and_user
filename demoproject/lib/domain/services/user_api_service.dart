import 'dart:convert';
import 'package:demoproject/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  static const String url = 'https://fake-json-api.mock.beeceptor.com/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
