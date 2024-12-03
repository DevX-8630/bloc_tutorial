import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_tutorial_app/model/posts_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('error while fetching data: Socket Exception');
    } on TimeoutException {
      throw Exception('error while fetching data: Timeout Exception');
    }
    throw Exception('error while fetching data');
  }
}
