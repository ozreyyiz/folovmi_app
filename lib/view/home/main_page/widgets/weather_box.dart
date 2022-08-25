import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
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
              padding: const EdgeInsets.all(12.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.sizeWidth(context, 0.21),
                        height: SizeConfig.sizeHeight(context, 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 16),
                            _text(LocaleKeys.weather_inside),
                            _text(LocaleKeys.weather_outside),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.sizeWidth(context, 0.22),
                        height: SizeConfig.sizeHeight(context, 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: SizeConfig.sizeWidth(context, 0.22),
                                height: 25,
                                child: _text(LocaleKeys.weather_temperature)),
                            _text(_weather.temperature.toString()),
                            _text(_weather.temperature.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.sizeWidth(context, 0.21),
                        height: SizeConfig.sizeHeight(context, 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: SizeConfig.sizeWidth(context, 0.2),
                              height: 20,
                              child: _text(LocaleKeys.weather_humidty),
                            ),
                            _text(_weather.humidity.toString()),
                            _text(_weather.humidity.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.sizeWidth(context, 0.21),
                        height: SizeConfig.sizeHeight(context, 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: SizeConfig.sizeWidth(context, 0.21),
                              height: 20,
                              child: _text(LocaleKeys.weather_pm2_5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Texty(
                                  text: "Mid",
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Texty(
                                  text: "Mid",
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _text(String text) {
    return Container(width: SizeConfig.sizeWidth(context, .20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texty(
            text: text,
            fontSize: 15,
            color: ColorConstants.BLUE_FONT,
          ),
        ],
      ),
    );
  }
}
