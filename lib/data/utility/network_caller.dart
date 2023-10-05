import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/application/app.dart';
import 'package:ecommerce/presentation/screens/auth/email_verification_screen.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    Response response = await get(Uri.parse(url),
        headers: {'token': AuthController.token.toString()});
    log(response.statusCode.toString());
    log(response.body);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse(response.statusCode, true, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(response.statusCode, false, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(-1, false, null);
  }

  static Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    Response response = await post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.token.toString()
        },
        body: jsonEncode(body),
    );
    log(response.statusCode.toString());
    log(response.body);
    try {
      if (response.statusCode == 200) {
        return NetworkResponse(response.statusCode, true, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(response.statusCode, false, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(-1, false, null);
  }

  static Future<void> gotoLogin() async {
    await AuthController.clear();
    Navigator.pushAndRemoveUntil(
        CraftyBay.globalKey.currentContext!,
        MaterialPageRoute(
            builder: (context) => const EmailVerificationScreen()),
        (route) => false);
  }
}
