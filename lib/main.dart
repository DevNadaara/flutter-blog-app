import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './blogs/blogModel.dart';
import './blogs/blogItem.dart';
import './blogs/blogDetail.dart';
import './service/remoteService.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlogsApp(),
  ));
}

class BlogsApp extends StatefulWidget {
  const BlogsApp({super.key});

  @override
  State<BlogsApp> createState() => _BlogsAppState();
}

class _BlogsAppState extends State<BlogsApp> {
  List<BlogModel>? blogs = [];
  var isLoading = false;

  // @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    blogs = await RemoteService().fechtBlogs();

    if (blogs != null) {
      setState(() {
        isLoading = true;
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          title: Text("Blog app"),
        ),
        body: Visibility(
          visible: isLoading,
          child: FutureBuilder(builder: (context, snapshot) {
            return ListView.builder(
              itemCount: blogs?.length,
              itemBuilder: (context, index) => BlogItem(
                  blogs![index].id,
                  blogs![index].cover.url,
                  blogs![index].title,
                  blogs![index].summary,
                  blogs![index].body),
            );
          }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
