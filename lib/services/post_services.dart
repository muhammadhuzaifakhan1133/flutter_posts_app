import 'package:test1/models/post_model.dart';
import 'package:test1/network/api_client.dart';
import 'package:test1/services/storage_services.dart';
import 'package:test1/utils/api_constants.dart';

class PostServices {
 static Future<List<PostModel>> getPosts(int page) async {
    ApiClient apiClient = ApiClient();
    final response = await apiClient.getData(endpoint: ApiConstants.posts, queryParameters: {
      "_page": page.toString(),
    });
    List<PostModel> posts = [];
    if (response != null && response.isNotEmpty) {
      for (var item in response) {
        PostModel post = PostModel.fromJson(item);
        if (post.userId.toString() == LocalStorageServices.getUserId()) {
          post.isOwn = true;
        }
        posts.add(post);
      }
    }
    return posts;
  }
}