import 'dart:convert';
import 'dart:io';

import 'package:ecom_ui/data/models/categories_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_exceptions.dart';

class CategoriesApiService{


  Future<dynamic> getAllCategoriesApiService({required baseUrl})async{

    try {

      http.Response response = await http.get(Uri.parse(baseUrl)) ;
      return returnJsonResponse(response);

    } on SocketException catch (e) {
      throw FetchDataExecption(errorMsg: 'No Internet!! \n$e');
    }


  }



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