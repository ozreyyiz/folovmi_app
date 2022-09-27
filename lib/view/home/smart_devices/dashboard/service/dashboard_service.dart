import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DashboardService {
  final String baseUrl =
      "https://api.folovmi.com/lfsvr/rest/api/data-provider/dashboard/";
  final dio = Dio();
  final box = GetStorage();



Future getUser({required int userId})async{

}


  Future dashboardConnect()async{
var response=await dio.get(baseUrl+"",);
  }
}
