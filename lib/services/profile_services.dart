import 'package:test1/models/user_model.dart';
import 'package:test1/network/api_client.dart';

class ProfileServices {
  static Future<UserModel> getProfile(String id) async {
    ApiClient apiClient = ApiClient();
    final response = await apiClient.getData(endpoint: "users/$id");
    return UserModel.fromJson(response);
  }
}