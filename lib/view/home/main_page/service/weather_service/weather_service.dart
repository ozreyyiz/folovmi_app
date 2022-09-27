import 'package:dio/dio.dart';
import 'package:folovmi_app/view/home/main_page/model/weather_model.dart';
import 'package:folovmi_app/view/home/main_page/service/weather_service/get_location_service.dart';

Dio _dio = Dio();
Location _location=Location();

class WeatherService {
  Future<Weather> getCurrentWeather() async {
  await _location.getCurrentLocation();
    var api =
        "https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitide}&appid=2b1b45d63089e81a780258500db4f2e5&units=metric";

    var response = await _dio.get(api);
    var body = response.data;
    // print(Weather.fromJson(body).cityName);
    // print(Weather.fromJson(body).humidity);

    // print("hava");

    return Weather.fromJson(body);
  }
}
