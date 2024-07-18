import 'dart:convert';
import 'package:ecom_ui/utils/token_shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_exceptions.dart';

class CartApiService{

  Future<dynamic> addToCartApiService({required String baseUrl, required int prodductId, required int quantity })async{
    String token = await TokenPrefs().getToken();
    try {
      http.Response response = await http.post(Uri.parse(baseUrl),headers: {
        'Authorization': 'Bearer $token'
      }, body: jsonEncode({
        'quantity': quantity,
        'product_id': prodductId
      }));
      print('addToCartApiService ==> $response');
      return returnJsonResponse(response);
    } catch (e) {
      rethrow;
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