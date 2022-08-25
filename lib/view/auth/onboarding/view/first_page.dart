import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:folovmi_app/core/components/animations/easy_in_out.dart';

import 'package:folovmi_app/core/components/container/white_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
import 'package:folovmi_app/view/auth/onboarding/view/welcome_page.dart';
import 'package:folovmi_app/view/auth/onboarding/widgets/folovmi_logo.dart';
import 'package:folovmi_app/view/home/main_page/view/home_page.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/first_page_circle_widget.dart';

class OnboardingFirstPage extends StatefulWidget {
  const OnboardingFirstPage({Key? key}) : super(key: key);

  @override
  State<OnboardingFirstPage> createState() => _OnboardingFirstPageState();
}

class _OnboardingFirstPageState extends State<OnboardingFirstPage> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    box.erase();
    Future.delayed(Duration(seconds: 3), () {
      if (box.read("token") != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => WelcomePage())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.WHITE,
      body: SafeArea(
        child: Stack(
          children: [
            _folovmiLogo(context),
            _topCircle(size),
            _bottomBigCircle(size),
            _bottomSmallCircle(size),
          ],
        ),
      ),
    );
  }

  Widget _folovmiLogo(BuildContext context) {
    return Positioned(
        left: SizeConfig.sizeWidth(context, .07),
        top: SizeConfig.sizeHeight(context, 0.15),
        child: FolovmiLogo());
  }

  Positioned _bottomSmallCircle(Size size) {
    return Positioned(
      bottom: -200,
      left: -170,
      child: FirstPageCircle(
        size: size,
        heightWidth: size.height / 2,
        color: ColorConstants.LIGHTBLUE,
      ),
    );
  }

  Positioned _bottomBigCircle(Size size) {
    return Positioned(
      bottom: -170,
      left: -155,
      child: FirstPageCircle(
        size: size,
        heightWidth: size.height / 2,
        color: _ColorConstants.PINK,
      ),
    );
  }

  Positioned _topCircle(Size size) {
    return Positioned(
      top: -60,
      right: -60,
      child: FirstPageCircle(
        size: size,
        heightWidth: size.height * 4 / 14,
        color: ColorConstants.BLUE,
      ),
    );
  }
}

class _ColorConstants {
  static Color PINK = HexColor("FD7993");
}
