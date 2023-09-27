import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    log(response.body);

    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse(response.statusCode, true, decodedResponse);
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
