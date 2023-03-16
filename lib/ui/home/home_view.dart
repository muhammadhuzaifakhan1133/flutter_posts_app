import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test1/ui/home/home_viewmodel.dart';
import 'package:test1/ui/home/widgets/home_drawer.dart';
import 'package:test1/ui/home/widgets/posts_view.dart';
import 'package:test1/ui/home/widgets/profile_view.dart';
import 'package:test1/utils/extensions.dart';
import 'package:test1/utils/image_constants.dart';
import 'package:test1/widgets/color_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      fireOnViewModelReadyOnce: true,
      onViewModelReady: (viewModel) async {
        await viewModel.getPosts();
        await viewModel.getCurrentUser();
        viewModel.scrollController.addListener(() {
          if (viewModel.scrollController.position.pixels ==
              viewModel.scrollController.position.maxScrollExtent) {
            viewModel.getPosts();
          }
        });
        viewModel.isShowPage = true;
        viewModel.notifyListeners();
      },
      builder: (context, viewModel, child) {
        if (!viewModel.isShowPage) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorConstants.primaryColor,
                title: const Text("Home"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      viewModel.navigateToFilterPosts();
                    },
                  ),
                ],
                bottom: const TabBar(tabs: [
                  Tab(text: "POSTS"),
                  Tab(text: "PROFILE"),
                ]),
              ),
              drawer: homeDrawer(viewModel),
              body: TabBarView(children: [
                PostsView(viewModel: viewModel),
                ProfileView(user: viewModel.currentUser!),
              ])),
        );
      },
    );
  }
}
