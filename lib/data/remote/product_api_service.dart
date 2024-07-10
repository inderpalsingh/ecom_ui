import 'dart:convert';
import 'dart:io';

import 'package:ecom_ui/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;

class ProductApiService{

  Future<dynamic> getAllProductApiService({required String baseUrl})async{

    try {
      http.Response response = await http.get(Uri.parse(baseUrl));
      // print('response ==> $response');
      return returnJsonResponse(response);
    } on SocketException catch (e) {
      throw FetchDataExecption(errorMsg: 'No Internet!! \n$e');
    }

  }


  returnJsonResponse(http.Response jsonResponse) {
    switch (jsonResponse.statusCode) {
      case 200:
        var mData = jsonDecode(jsonResponse.body);
        print('response ==> $mData');
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