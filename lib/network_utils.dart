import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'auth_urils.dart';


class NetworkUtils {

  /// Api Get Method
  Future<dynamic> getMethod(String url, {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'token': AuthUtils.token ?? ''
      });
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          //moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Api Post Method
  Future<dynamic> postMethod(String url,
      {Map<dynamic, dynamic>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDc0MDY1MzksImRhdGEiOiJjc2VfMjEyMjAyMDAzMDExMTExMTFAbHVzLmFjLmJkIiwiaWF0IjoxNzA3MzIwMTM5fQ.euL8_y5JtqXMIjo8J7WHaHGnB4au-S6g5yyT6FurQGw'
          },
          body: jsonEncode(body));

      // print(response.body);
      // return jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          //moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');//
    }
  }

  /// Api delete Method
  Future<dynamic> deleteMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'token': AuthUtils.token ?? ''
      });

      if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'success') {
        return true;
        //return true;
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  // Future<void> moveToLogin() async {
  //   await AuthUtils.clearData();
  //   Navigator.pushAndRemoveUntil(
  //       TaskManager.globalKey.currentContext!,
  //       MaterialPageRoute(builder: (context) => const LoginScreen()),
  //           (route) => false);
  // }
}