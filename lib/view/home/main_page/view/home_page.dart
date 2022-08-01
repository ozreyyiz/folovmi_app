import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/view/default/view/default_page.dart';
import 'package:folovmi_app/view/home/main_page/service/smart_devices_list.dart';
import 'package:folovmi_app/view/home/smart_devices/model/smart_device_model.dart';
import 'package:folovmi_app/view/home/smart_devices/smart_devices/view/smart_devices_page.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/box/width_box.dart';
import '../../../../core/components/button/small_button.dart';
import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/device_box.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  final box = GetStorage();
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.register_register,
      isShort: true,
      isMain: true,
      onDispose: () {},
      onModelReady: (model) {},
      appBar: _appBar(),
      onPageBuilder: (context, value) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: _dataScreen(),
          ),
          _buttons(),
          Container(
            height: SizeConfig.sizeHeight(context, 0.28),
            decoration: BoxDecoration(
              color: ColorConstants.BLUE_ICE,
              borderRadius:
                  BorderRadiusConstants.BORDER_RADIUS_SHORT_BODY_CONTAINER,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.8),
                itemCount: SmartDevices().smart_devices.length,
                itemBuilder: (BuildContext context, int index) {
                  final SmartDeviceModel item =
                      SmartDevices().smart_devices[index];
                  return DeviceBox(
                    iconPath: item.iconPath,
                    text: item.text,
                    widget: item.widget,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _appBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 50, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                box.remove("token");
                print(box.read("token"));
              },
              child: Image.asset("assets/images/Group 916.png")),
          Texty(text: "folovmi Technology", fontSize: 15, color: Colors.white),
          Row(
            children: [
              SvgPicture.asset("assets/images/a.svg"),
              GestureDetector(
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SmartDevicesPage()),
                      )),
                  child: SvgPicture.asset("assets/images/b.svg")),
            ],
          )
        ],
      ),
    );
  }

  SingleChildScrollView _buttons() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SmallButton(
              onTap: a,
              height: SizeConfig.sizeHeight(context, 0.1),
              width: 120,
              color: ColorConstants.BLUE,
              text: "EAT",
            ),
            WidthBox(width: 10),
            SmallButton(
              onTap: a,
              height: SizeConfig.sizeHeight(context, 0.1),
              width: 120,
              color: ColorConstants.PINK,
              text: "SOS",
            ),
            WidthBox(width: 10),
            SmallButton(
              onTap: a,
              height: SizeConfig.sizeHeight(context, 0.1),
              width: 120,
              color: ColorConstants.YELLOW,
              text: "CLEANING",
            ),
            WidthBox(width: 10),
            SmallButton(
              onTap: a,
              height: SizeConfig.sizeHeight(context, 0.1),
              width: 120,
              color: ColorConstants.GREEN,
              text: "TRY",
            ),
          ],
        ),
      ),
    );
  }

  a() {}
  Container _dataScreen() {
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/sun.svg"),
                SizedBox(width: 10),
                Texty(
                  text: "Sun / Istanbul",
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
                      text: "25      ",
                      fontSize: 15,
                      color: ColorConstants.BLUE_DATA,
                    ),
                    Texty(
                      text: "   54   ",
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
      ),
    );
  }
}
