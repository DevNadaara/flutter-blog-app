import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './blogDetail.dart';

class BlogItem extends StatelessWidget {
  final String id;
  final String imageUri;
  final String title;
  final String summary;
  final String body;

  const BlogItem(this.id, this.imageUri, this.title, this.summary, this.body);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            width: 80,
            height: 100,
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUri,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          summary,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlogDetail(
                    blogId: id,
                    title: title,
                    body: body,
                    imageUrl: imageUri,
                  )),
        )
      },
    );
  }
}
