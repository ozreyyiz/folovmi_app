import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/core/components/snackbar/snackbar.dart';
import 'package:folovmi_app/view/auth/login/model/login_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../riverpod/riverpod_management.dart';

class LoginService {
  final String baseUrl = "https://api.folovmi.com/lfsvr/rest/api/";
  final dio = Dio();
  final box = GetStorage();

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

  Future<Response> loginCall(
      {required String email, required String password,required BuildContext context}) async {
    Map<String, dynamic> json = {"email": email, "hashPass": password};

    // var response = await dio.post(baseUrl + "login", data: json);

    // if (response.statusCode == 200) {
    //   var result = LoginModel.fromJson(response.headers.map);
    //   var token = response.headers["authorization"];
    //     box.write("token", token);
    //   log("gelen response ${response.statusCode}");
    //   return result;
    // } else {
    //   throw ("Bir sorun oluştu ${response.statusCode}");
    // }


    

    // post(dynamic data) async {
      // print('URI :$apiUrl$uri');
      // print('Method: POST');
  late final WidgetRef ref = context as WidgetRef;

      try {
        var response = await dio.post(baseUrl + "login", data: json,options: getOptions());
        print('INPUT DATA $json');
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202 ||
            response.statusCode == 203 ||
            response.statusCode == 204) {
          print('OUTPUT DATA : $response');
                ref.read(loginRiverpod).email.clear();
        ref.read(loginRiverpod).password.clear();

          return response;
        } else if (response.statusCode == 500 || response.statusCode == 409) {
          var error = LoginModel.fromJson(response.data);
   
          throw Exception(error.statusCode);
        } else if (response.statusCode == 403) {
          snackBar(context,"Hatalı Kullanıcı !");
          throw Exception("Forbidden");
         
        } 

       else {
          throw Exception(response.statusMessage);
        }
      } on DioError catch (ex) {

   print(ex.message);
        throw Exception("No Internet Connection!");
      }
    }
  }
// }
