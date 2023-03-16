import 'package:flutter/material.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/widgets/color_constants.dart';

Card postCard(PostModel post) {
  return Card(
    elevation: 5,
    shadowColor: ColorConstants.primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: ColorConstants.black)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(post.title!.toUpperCase(),
            style: TextStyle(
                color:
                    post.isOwn ? ColorConstants.primaryColor : Colors.black)),
        subtitle: Text(post.body!,
            style: TextStyle(
                color: post.isOwn ? ColorConstants.black : Colors.grey)),
      ),
    ),
  );
}
