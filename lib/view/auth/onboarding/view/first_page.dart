import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:folovmi_app/core/components/animations/easy_in_out.dart';

import 'package:folovmi_app/core/components/container/white_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
import 'package:folovmi_app/view/auth/onboarding/view/welcome_page.dart';
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
    Future.delayed(Duration(seconds: 2), () {
      if (box.read("token") != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => WelcomePage())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(flex: 3, child: WhiteContainer()),
                _folovmiLogo(size),
                const Expanded(flex: 4, child: WhiteContainer()),
              ],
            ),
            _topCircle(size),
            _bottomBigCircle(size),
            _bottomSmallCircle(size),
          ],
        ),
      ),
    );
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

  Widget _folovmiLogo(Size size) {
    return EasyInOutAnimation(
      duration: Duration(milliseconds: 1000),
      child: Expanded(
        flex: 7,
        child: Column(
          children: [
            Image.asset(
              "assets/images/folovmi_logo.png",
              height: size.height * 5.7 / 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                children: [
                  Texty(
                    text: LocaleKeys.welcome_name,
                    fontSize: 22,
                    color: ColorConstants.BLACK,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                    ),
                    child: Texty(
                      text: LocaleKeys.welcome_subtitle,
                      fontSize: 15,
                      color: ColorConstants.BLACK,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorConstants {
  static Color PINK = HexColor("FD7993");
}
