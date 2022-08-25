import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/view/home/main_page/service/smart_devices_list.dart';
import 'package:folovmi_app/view/home/main_page/widgets/weather_box.dart';
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
            child: WeatherBox(context: context),
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
          // Image.asset("assets/images/Group 916.png"),
             SvgPicture.asset("assets/images/camera.svg"),
          Texty(text: "folovmi Technology", fontSize: 15, color: Colors.white),
          Row(
            children: [
              GestureDetector(onTap: (){
                box.erase();
              },child: SvgPicture.asset("assets/images/a.svg")),
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
 

}
