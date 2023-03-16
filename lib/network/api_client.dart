import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test1/utils/api_constants.dart';
import 'package:test1/utils/dialogs.dart';

class ApiClient {
  _handleResponse<T>(Future<http.Response> response) async {
    final res = await response;
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body);
    } else {
      Dialogs.errorDialog(message: res.body);
    }
  }

  Future<dynamic> getData(
      {required String endpoint,
      Map<String, String>? queryParameters,
      Map<String, String>? headers}) async {
    final uri = Uri.https(ApiConstants.baseUrl, endpoint, queryParameters);
    final response = http.get(uri, headers: headers);
    return await _handleResponse<List<dynamic>>(response);
  }
}
