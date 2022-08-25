import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/view/home/main_page/widgets/weather_box.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/model/dashboard_data_model.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/model/dataList.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/text/texty.dart';
import '../../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../../core/constants/color/color_constants.dart';
import '../../../../../core/constants/size/size_config.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../main_page/model/weather_model.dart';
import '../../../main_page/service/weather_service/weather_service.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Weather _weather = Weather(weatherDescription: '');

  WeatherService service = WeatherService();

  Future<void> getData() async {
    _weather = await service.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.dashboard_dashboard,
      isShort: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: Column(
          children: [
            _weatherBox(context),
            HeightBox(height: 20),
            _homeHeader(),
            HeightBox(height: 20),
            SingleChildScrollView(
              child: Container(
                height: SizeConfig.sizeHeight(context, .45),
                width: double.infinity,
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: DashboardDatas().datas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DashboardData item = DashboardDatas().datas[index];
                    return Container(
                      padding: PaddingConstants.generalPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: ColorConstants.BLUE, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [SvgPicture.asset(item.iconPath)],
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              HeightBox(height: 10),
                              Texty(
                                  text: item.header,
                                  fontSize: 18,
                                  color: ColorConstants.BLUE_FONT),
                              HeightBox(height: 10),
                              Texty(
                                  text: item.text,
                                  fontSize: 22,
                                  color: ColorConstants.BLUE_FONT)
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _homeHeader() {
    return Row(
      children: [
        WidthBox(width: 20),
        SvgPicture.asset("assets/images/home_icon.svg"),
        WidthBox(width: 10),
        Texty(
            text: LocaleKeys.dashboard_home,
            fontSize: 18,
            color: ColorConstants.ORANGE)
      ],
    );
  }

  Container _weatherBox(BuildContext context) {
    return Container(
      height: SizeConfig.sizeHeight(context, 0.25),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _dataColumn(
                          header: LocaleKeys.dashboard_temperature,
                          data: _weather.temperature.toString()),
                      _dataColumn(
                          header: LocaleKeys.dashboard_humidty,
                          data: _weather.humidity.toString()),
                      SizedBox(
                        height: SizeConfig.sizeHeight(context, 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texty(
                                text: LocaleKeys.dashboard_pm2_5,
                                fontSize: 16,
                                color: ColorConstants.BLUE_FONT),
                            Texty(
                                text: "Mid",
                                fontSize: 16,
                                color: ColorConstants.GREEN),
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

  Widget _dataColumn({required String header, required String data}) {
    return SizedBox(
      height: SizeConfig.sizeHeight(context, 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Texty(text: header, fontSize: 16, color: ColorConstants.BLUE_FONT),
          Texty(text: data, fontSize: 16, color: ColorConstants.BLUE_FONT),
        ],
      ),
    );
  }
}
