import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_models.dart';

class ApiServices {

  Future<List<PostModel>> fetchPosts() async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data.map((e) => PostModel.fromjson(e)).toList();

    } else {
      throw Exception('Failed to load posts');
    }
  }
}