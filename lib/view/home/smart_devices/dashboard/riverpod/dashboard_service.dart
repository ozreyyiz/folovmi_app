import 'dart:io';

import 'package:dio/dio.dart';
import 'package:folovmi_app/view/home/main_page/service/user_data_service.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/model/dash_model.dart';
import 'package:get_storage/get_storage.dart';

final dio = Dio();
final box = GetStorage();

final String baseUrl =
    "https://api.folovmi.com/lfsvr/rest/api/data-provider/dashboard/";

   String token = box.read("token").toString();
   String userId = box.read("userId").toString();


class DashboardService {
  Future getData() async {
    try {
      Response response = await dio.get(baseUrl + userId, options: getOptions());

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        // print('OUTPUT DATA : ${response.data["token"]}');
  
    
   

        return response;
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (ex) {
      print(ex.message);
      throw Exception("No Internet Connection!");
    }
  }

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
}
