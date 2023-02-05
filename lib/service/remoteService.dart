import 'dart:convert';

import 'package:http/http.dart' as http;
import '../blogs/blogModel.dart';

class RemoteService {
  Future<List<BlogModel>?> fechtBlogs() async {
    var client = http.Client();
    var uri = Uri.parse('http://192.168.1.6:4000/api/posts');

    var res = await client.get(uri);
    print('reponse ${res}');

    if (res.statusCode == 200) {
      // var result = res.body;

      Iterable data = jsonDecode(res.body)['data'];

      List<BlogModel> blogs = data.map((e) => BlogModel.fromJson(e)).toList();

      return blogs;
      // return blogModelFromJson(json);
    }
  }
}
