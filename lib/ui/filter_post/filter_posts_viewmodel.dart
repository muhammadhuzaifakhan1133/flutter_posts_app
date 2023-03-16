import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test1/models/post_model.dart';

class FilterPostsViewModel extends BaseViewModel {
  List<PostModel> posts;
  FilterPostsViewModel({required this.posts});
  TextEditingController searchController = TextEditingController();
  List<PostModel> searchedPosts = [];

  searchPosts() {
    if (searchController.text.isEmpty) {
      searchedPosts = [];
      notifyListeners();
      return;
    }
    searchedPosts = posts
        .where((element) =>
            element.title!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            element.body!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
