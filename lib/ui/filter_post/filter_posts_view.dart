import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';
import 'package:test1/models/post_model.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/ui/filter_post/filter_posts_viewmodel.dart';
import 'package:test1/widgets/custom_textfield.dart';
import 'package:test1/widgets/post_card.dart';

class FilterPostsView extends StatelessWidget {
  final List<PostModel> posts;
  final UserModel currentUser;
  const FilterPostsView(
      {super.key, required this.posts, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => FilterPostsViewModel(posts: posts),
        builder: (context, viewModel, child) {
          return Scaffold(
              body: SafeArea(
                  child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        locator<NavigationService>().back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: CustomTextField(
                      textEditingController: viewModel.searchController,
                      hintText: "Search posts by title or body",
                      onChanged: (value) {
                        viewModel.searchPosts();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: viewModel.searchedPosts.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 5);
                  },
                  itemBuilder: (context, index) {
                    return postCard(
                      viewModel.searchedPosts[index],
                    );
                  },
                ),
              ),
            ],
          )));
        });
  }
}
