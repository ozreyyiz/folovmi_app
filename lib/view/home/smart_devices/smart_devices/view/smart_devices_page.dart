import 'package:flutter/material.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../../core/constants/color/color_constants.dart';
import '../../../../../core/constants/size/size_config.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../main_page/service/smart_devices_list.dart';
import '../../../main_page/widgets/device_box.dart';
import '../../model/smart_device_model.dart';

class SmartDevicesPage extends StatefulWidget {
  SmartDevicesPage({Key? key}) : super(key: key);

  @override
  State<SmartDevicesPage> createState() => _SmartDevicesPageState();
}

class _SmartDevicesPageState extends State<SmartDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.smart_devices,
      isShort: false,
      isMain: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: SizeConfig.sizeHeight(context, 1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    padding: EdgeInsets.all(0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.6),
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
        ),
      ),
    );
  }
}
