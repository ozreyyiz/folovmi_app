import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/components/container/colorful_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../../../core/init/lang/locale_keys.g.dart';

class EKGPage extends StatelessWidget {
  const EKGPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: "",
        title: LocaleKeys.ekg_ekg,
        isShort: true,
        onDispose: () {},
        onModelReady: (model) {},
        onPageBuilder: (context, value) => Padding(
              padding: PaddingConstants.generalPadding,
              child: Container(
                height: SizeConfig.sizeHeight(context, 0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dataContainer(context),
                    Divider(),
                   
                    _ekgScreen(),
                    SvgPicture.asset("assets/images/ekg.svg"),
                    HeightBox(height: 20),
                  ],
                ),
              ),
            ));
  }

  Row _ekgScreen() {
    return Row(
      children: [
        WidthBox(width: 15),

        SvgPicture.asset("assets/images/duration.svg"),
        WidthBox(width: 5),
        Texty(
          text: LocaleKeys.ekg_duration,
          fontSize: 20,
          color: ColorConstants.BLUE_FONT,
        ),
        WidthBox(width: 5),
        Texty(
          text: "0",
          fontSize: 20,
          color: ColorConstants.BLUE_FONT,
        ),
      ],
    );
  }

  Row _dataContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dataBox(context),
        _dataBox(context),
      ],
    );
  }

  Container _dataBox(BuildContext context) {
    return Container(
      width: SizeConfig.sizeWidth(context, 0.44),
      height: SizeConfig.sizeHeight(context, 0.2),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.CONTAINER_GRAY),
        borderRadius: BorderRadiusConstants.EKG_CONTAINER_RADIUS,
      ),
      child: Padding(
        padding: PaddingConstants.generalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _dataRow(
              dataText: LocaleKeys.ekg_rr_max,
              data: 1062,
            ),
            _dataRow(
              dataText: LocaleKeys.ekg_hrv,
              data: 0,
            ),
            _dataRow(
              dataText: LocaleKeys.ekg_mood,
              data: 0,
            ),
          ],
        ),
      ),
    );
  }

  Row _dataRow({required String dataText, required double data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Texty(
          text: dataText,
          fontSize: 16,
          color: ColorConstants.BLUE_FONT,
        ),
        Texty(
          text: data.toString(),
          fontSize: 16,
          color: ColorConstants.BLUE_FONT,
        ),
      ],
    );
  }
}
