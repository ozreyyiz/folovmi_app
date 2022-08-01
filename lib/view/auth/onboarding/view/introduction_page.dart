import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:folovmi_app/core/components/animations/easy_in_out.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
import 'package:folovmi_app/view/auth/onboarding/view/welcome_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 18),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 500),
                            child: _realTimeEmergencyAlertBox(size)),
                        const SizedBox(height: 18),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 700),
                            child: _smartDevicesManagenmentBox(size)),
                        const SizedBox(height: 18),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 900),
                            child: _processManagementBox(size)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 600),
                            child: _realTimeVitalHealthTracerBox(size)),
                        const SizedBox(height: 18),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 800),
                            child: _realTimeSecruityTrackerBox(size)),
                        EasyInOutAnimation(
                            duration: Duration(milliseconds: 1200),
                            child: _folovmiLogo(size)),
                      ],
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _realTimeEmergencyAlertBox(Size size) {
    return Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: _ColorConstants.INTRDUCTION_BOX_PINK,
        borderRadius: BorderRadiusConstants.INTRODUCTION_BORDER_RADIUS,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxHeader(LocaleKeys.introduction_emergencyAlert_header),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(LocaleKeys.introduction_emergencyAlert_1),
              _title(LocaleKeys.introduction_emergencyAlert_2),
              _title(LocaleKeys.introduction_emergencyAlert_3),
              _title(LocaleKeys.introduction_emergencyAlert_4),
              _title(LocaleKeys.introduction_emergencyAlert_5),
            ],
          )
        ],
      ),
    );
  }

  Container _smartDevicesManagenmentBox(Size size) {
    return Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: _ColorConstants.INTRDUCTION_BOX_BLUE,
        borderRadius: BorderRadiusConstants.INTRODUCTION_BORDER_RADIUS,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxHeader(LocaleKeys.introduction_smartDevices_header),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(LocaleKeys.introduction_smartDevices_1),
              _title(LocaleKeys.introduction_smartDevices_2),
              SizedBox(height: size.height / 15),
            ],
          )
        ],
      ),
    );
  }

  Container _processManagementBox(Size size) {
    return Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: _ColorConstants.INTRDUCTION_BOX_LIGTHGREEN,
        borderRadius: BorderRadiusConstants.INTRODUCTION_BORDER_RADIUS,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxHeader(LocaleKeys.introduction_processManagement_header),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(LocaleKeys.introduction_processManagement_1),
              _title(LocaleKeys.introduction_processManagement_2),
              _title(LocaleKeys.introduction_processManagement_3),
              SizedBox(height: size.height / 30),
            ],
          )
        ],
      ),
    );
  }

  Container _realTimeVitalHealthTracerBox(Size size) {
    return Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: _ColorConstants.INTRDUCTION_BOX_GREEN,
        borderRadius: BorderRadiusConstants.INTRODUCTION_BORDER_RADIUS,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxHeader(LocaleKeys.introduction_vitalHealth_header),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(LocaleKeys.introduction_vitalHealth_1),
              _title(LocaleKeys.introduction_vitalHealth_2),
              _title(LocaleKeys.introduction_vitalHealth_3),
              _title(LocaleKeys.introduction_vitalHealth_4),
              _title(LocaleKeys.introduction_vitalHealth_5),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }

  Container _realTimeSecruityTrackerBox(Size size) {
    return Container(
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: _ColorConstants.INTRDUCTION_BOX_DARKBLUE,
        borderRadius: BorderRadiusConstants.INTRODUCTION_BORDER_RADIUS,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxHeader(LocaleKeys.introduction_securityTracker_header),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(LocaleKeys.introduction_securityTracker_1),
              _title(LocaleKeys.introduction_securityTracker_2),
              _title(LocaleKeys.introduction_securityTracker_3),
              _title(LocaleKeys.introduction_securityTracker_4),
              _title(LocaleKeys.introduction_securityTracker_5),
            ],
          )
        ],
      ),
    );
  }

  Widget _folovmiLogo(Size size) {
    return SizedBox(
        height: size.height / 4.2,
        child: Image.asset("assets/images/folovmi_logo.png"));
  }

  Opacity _divider() {
    return Opacity(
      opacity: 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Divider(
          color: Colors.black,
          thickness: 1,
          height: 5,
        ),
      ),
    );
  }

  Padding _boxHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Texty(
        text: text,
        color: ColorConstants.WHITE,
        fontSize: 12,
      ),
    );
  }
}

Padding _title(String text) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Texty(
      text: text,
      fontSize: 12,
      color: ColorConstants.WHITE,
    ),
  );
}

class _ColorConstants {
  static Color INTRDUCTION_BOX_PINK = HexColor("FB8199");
  static Color INTRDUCTION_BOX_BLUE = HexColor("1FBBEB");
  static Color INTRDUCTION_BOX_LIGTHGREEN = HexColor("EBD987");
  static Color INTRDUCTION_BOX_GREEN = HexColor("299792");
  static Color INTRDUCTION_BOX_DARKBLUE = HexColor("4D80BE");
}
