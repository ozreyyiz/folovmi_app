import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:folovmi_app/view/auth/login/model/login_model.dart';
import 'package:get_storage/get_storage.dart';

class LoginService {
  final String baseUrl = "https://api.folovmi.com/lfsvr/rest/api/";
  final dio = Dio();
  final box=GetStorage();

  Future<LoginModel> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "hashPass": password};

    var response = await dio.post(baseUrl + "login", data: json);

    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(response.headers.map);
      var token = response.headers["authorization"];
        box.write("token", token);
      log("gelen response ${response.statusCode}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
