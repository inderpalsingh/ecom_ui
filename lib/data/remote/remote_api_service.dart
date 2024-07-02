import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../utils/api_exceptions.dart';

class RemoteApiService {
  Future<dynamic> userLogin({required String baseUrl, required String username, required String password,int expiresInMins = 30}) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl),
        body: json.encode({
            'username': username,
            'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      // Log the entire response body
      print('Response Body: ${response.body.toString()}');

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
