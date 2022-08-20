import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/view/home/main_page/model/weather_model.dart';
import 'package:folovmi_app/view/home/main_page/service/weather_service/get_location_service.dart';
import 'package:folovmi_app/view/home/main_page/service/weather_service/permission_location.dart';
import 'package:folovmi_app/view/home/main_page/service/weather_service/weather_service.dart';

import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/constants/size/size_config.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  WeatherService service = WeatherService();
  @override
  void initState() {
    super.initState();
    GeolocatorService().determinePosition();
    service.getCurrentWeather();
  }

  Location _location = Location();
  Weather _weather = Weather(weatherDescription: '');

  Future<void> getData() async {
    _weather = await service.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.sizeHeight(context, 0.3),
      width: SizeConfig.sizeWidth(context, 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusConstants.BORDER_RADIUS_CONTAINER,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 224, 226, 229),
              offset: const Offset(
                0.0,
                1.5,
              ),
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ]),
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/sun.svg"),
                      SizedBox(width: 10),
                      Texty(
                        text: _weather.cityName!,
                        fontSize: 18,
                        color: ColorConstants.ORANGE,
                      ),
                    ],
                  ),
                  Divider(color: ColorConstants.GRAY_FONT, height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Texty(
                            text: "       ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "Temperature",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "Humidty",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "PM2.5",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Texty(
                            text: "Outside",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "${_weather.temperature}      ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "   ${_weather.humidity}   ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "   Mid  ",
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Texty(
                            text: "Inside   ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "28      ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "   63   ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                          Texty(
                            text: "            ",
                            fontSize: 15,
                            color: ColorConstants.BLUE_DATA,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
