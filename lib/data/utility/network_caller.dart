import 'dart:convert';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    Response response = await get(Uri.parse(url));
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        NetworkResponse(response.statusCode, true, decodedResponse);
      } else if (response.statusCode == 401) {
        gotoLogin();
      }
    } catch (e) {
      e.toString();
    }
    return NetworkResponse(-1, false, null);
  }
}

Future<void> gotoLogin() async {}
