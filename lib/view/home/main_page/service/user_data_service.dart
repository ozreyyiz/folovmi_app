import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/view/auth/login/model/riverpod/login_riverpod.dart';
import 'package:folovmi_app/view/home/main_page/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../riverpod/riverpod_management.dart';

final box = GetStorage();

class UserDataService {
  final String baseUrl = "https://api.folovmi.com/lfsvr/rest/api/user/mail/";
  final dio = Dio();

  static String mail = box.read("email").toString();
  static String token = box.read("token").toString();

  static Map<String, dynamic> getHeaders() {
    var map = {
      "HttpHeaders.contentTypeHeader": "application/json",
      HttpHeaders.acceptCharsetHeader: "iso-8859-1",
      HttpHeaders.authorizationHeader: token,
    };
    return map;
  }

  static Options getOptions() {
    return Options(
        receiveTimeout: 100000000000,
        sendTimeout: 1000000,
        validateStatus: (status) {
          return true;
        },
        headers: getHeaders());
  }

  Future<UserModel> getData() async {
    try {
      var response = await dio.get(baseUrl + mail, options: getOptions());

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        // print('OUTPUT DATA : ${response.data["token"]}');
        print(response.data["userId"]);
        print("USER DATA SERVİCE");

        return UserModel.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (ex) {
      print(ex.message);
      throw Exception("No Internet Connection!");
    }
  }
}
