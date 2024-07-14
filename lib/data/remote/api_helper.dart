import 'dart:convert';

import 'package:ecom_ui/utils/token_shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  postApi({required String baseUrl, Map<String, dynamic>? mapData, bool isHeader = false}) async {


    /// token
    String token = '';

    /// Check token
    if (isHeader) {
      token = await TokenPrefs().getToken();
    }

    try {
      var responseData = await http.post(Uri.parse(baseUrl),body: mapData!=null?jsonEncode(mapData):{}, headers: isHeader? {
        'Authorization' :'Bearer $token'
      }:{});
    } catch (e) {

    }
  }
}
