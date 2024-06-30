import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utils/api_exceptions.dart';

class RemoteApiService{

  Future<dynamic> userLogin({required String baseUrl}) async{

    try{

      http.Response response = await http.get(Uri.parse(baseUrl),headers: {
        'Content-Type': 'application/json',
      });

      return returnJsonResponse(response);
    } on SocketException catch (e) {
      throw (FetchDataExecption(errorMsg: 'No Internet!! \n$e'));
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
        throw '${jsonResponse.statusCode}';
    }
  }
}