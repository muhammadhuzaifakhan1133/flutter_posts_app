import 'package:flutter/material.dart';
import 'package:test1/ui/home/home_viewmodel.dart';
import 'package:test1/widgets/color_constants.dart';
import 'package:test1/widgets/post_card.dart';

class PostsView extends StatelessWidget {
  final HomeViewModel viewModel;
  const PostsView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: viewModel.scrollController,
      padding: EdgeInsets.all(5),
      itemCount: viewModel.posts.length + (viewModel.isLoading ? 1 : 0),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
      itemBuilder: (context, index) {
        if (index == viewModel.posts.length) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Loading"),
                SizedBox(width: 10),
                CircularProgressIndicator(color: Colors.black),
              ],
            ),
          );
        }
        return postCard(viewModel.posts[index]);
      },
    );
  }
}
