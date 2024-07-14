import 'dart:convert';
import 'dart:io';

import 'package:ecom_ui/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;

class RegisterApiService {
  Future<dynamic> signupService({required String baseUrl, required String name, required String mobile_number, required String email, required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl),
          body: jsonEncode(
            {
              'name': name,
              'mobile_number': mobile_number,
              'email': email,
              'password': password,
            },
          ));

      return returnJsonResponse(response);
    } on SocketException catch (e) {
      throw FetchDataExecption(errorMsg: 'No Internet!! \n$e');
    }
  }

  /// create function
  dynamic returnJsonResponse(http.Response jsonResponse) {
    switch (jsonResponse.statusCode) {
      case 200:
        var mData = jsonDecode(jsonResponse.body);
        return mData;

      case 400:
        throw BadRequestException(errorMsg: jsonResponse.body.toString());

      case 401:
        throw UnauthorisedException(errorMsg: jsonResponse.body.toString());

      case 500:
        throw UnauthorisedException(errorMsg: jsonResponse.body.toString());

      default:
        // throw '${jsonResponse.statusCode}';
        throw UnauthorisedException(errorMsg: jsonResponse.body.toString());
    }
  }
}
