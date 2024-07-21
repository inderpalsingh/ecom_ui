import 'dart:convert';
import 'dart:io';

import 'package:ecom_ui/utils/api_exceptions.dart';
import 'package:ecom_ui/utils/token_shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderApiService{


  Future<dynamic> createOrder({required String baseUrl}) async{
    String token = await TokenPrefs().getToken() ;
    try {
      http.Response response = await http.post(Uri.parse(baseUrl),headers: {
          'Authorization': 'Bearer $token'
      });
      return returnJsonResponse(response);
    } on SocketException catch (e) {
      throw FetchDataExecption(errorMsg: 'No Internet!! \n$e');
    }

  }



  dynamic returnJsonResponse(http.Response jsonResponse) {
    switch (jsonResponse.statusCode) {
      case 200: {

        var mData = jsonDecode(jsonResponse.body);
        return mData;

      }


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