import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:folovmi_app/view/auth/register/model/sign_up_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod/riverpod_management.dart';

class SignUpService {
  final String baseUrl = "https://api.folovmi.com/lfsvr/rest/api/";
  final dio = Dio();
  

  static Map<String, String> getHeaders() {
    var map = {
      "HttpHeaders.contentTypeHeader": "application/json",
      HttpHeaders.acceptCharsetHeader: "iso-8859-1",
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

  Future<Response> signUpCall({
   
    required String name,
    required String lastName,
    required String gender,
    required String birthDate,
    required int weight,
    required int height,
    required String identityNumber,
    required String phoneNumber,
    required String email,
    required String hashPass,
    required BuildContext context,
  }) async {
    Map<String, dynamic> json = {
      
      "name": name,
      "lastName": lastName,
      "gender": gender,
      "birthDate": birthDate,
      "weight": weight,
      "height": height,
      "identityNumber": identityNumber,
      "phoneNumber": phoneNumber,
      "email": email,
      "hashPass": hashPass,
    };
  late final WidgetRef ref = context as WidgetRef;

    try {
      var response =
          await dio.post(baseUrl + "user", data: json, options: getOptions());
      print("data $json");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        print("success $response");
     
       SignUpModel model=SignUpModel.fromJson(response.data);
       print(model.userId);
       

        
        ref.read(signUpRiverpod).email.clear();
        ref.read(signUpRiverpod).password.clear();
        return response;
      } else if (response.statusCode == 500 || response.statusCode == 409) {
        var error = SignUpModel.fromJson(response.data);
        print(response.statusMessage);
        throw Exception(error.statusCode);
      } else if (response.statusCode == 403) {
        throw Exception("Forbidden");
      } else {
        throw Exception(response.statusMessage);
      }
    }on DioError catch (ex) {
      print(ex.message);
        throw Exception("No Internet Connection!");
    }
  }
}
