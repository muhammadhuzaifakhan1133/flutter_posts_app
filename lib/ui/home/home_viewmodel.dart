import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';
import 'package:test1/app/app.router.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/services/auth_services.dart';
import 'package:test1/services/post_services.dart';
import 'package:test1/services/profile_services.dart';
import 'package:test1/services/storage_services.dart';

class HomeViewModel extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  UserModel? currentUser;
  bool isShowPage = false;
  bool isLoading = false;
  List<PostModel> posts = [];
  int page = 1;

  getPosts() async {
    isLoading = true;
    notifyListeners();
    List<PostModel> nextPosts = await PostServices.getPosts(page);
    posts.addAll(nextPosts);
    page++;
    isLoading = false;
    notifyListeners();
  }

  logout() {
    AuthServices.logout();
  }

  navigateToFilterPosts() async {
    locator<NavigationService>().navigateTo(Routes.filterPostsView,
        arguments:
            FilterPostsViewArguments(posts: posts, currentUser: currentUser!));
  }

  getCurrentUser() async {
    currentUser =
        await ProfileServices.getProfile(LocalStorageServices.getUserId()!);
  }
}
