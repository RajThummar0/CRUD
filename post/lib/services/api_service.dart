import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';

class ApiService {

  Future<LoginResponseModel> loginUser({
    required String email,
    required String password,
  }) async {

    final url = Uri.parse("https://reqres.in/api/login");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return LoginResponseModel.fromJson(data);

    } else {

      throw Exception("Login failed: ${response.body}");
    }
  }
}