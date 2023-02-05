import 'package:blog_app/blogs/blogModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class BlogDetail extends StatelessWidget {
  final String blogId;
  final String title;
  final String imageUrl;
  final dynamic body;

  const BlogDetail({
    super.key,
    required this.blogId,
    required this.title,
    required this.imageUrl,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    var htmltoString = parse(body);
    var bodyData = parse(htmltoString.body!.text).documentElement!.text;
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Detail'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    height: 250,
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  bodyData,
                  style:
                      TextStyle(color: Colors.black, fontSize: 20, height: 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
