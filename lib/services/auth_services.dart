import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';
import 'package:test1/app/app.router.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/network/api_client.dart';
import 'package:test1/services/storage_services.dart';
import 'package:test1/utils/api_constants.dart';

class AuthServices {
  static Future<UserModel?> login({
    required String email,
    required String username,
  }) async {
    ApiClient apiClient = ApiClient();
    final response =
        await apiClient.getData(endpoint: ApiConstants.users, queryParameters: {
      "email": email,
      "username": username,
    });
    if (response != null && response.isNotEmpty) {
      return UserModel.fromJson(response[0]);
    }
    return null;
  }

  static Future<void> logout() async {
    LocalStorageServices.deleteUserId();
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.loginView);
  }
}
