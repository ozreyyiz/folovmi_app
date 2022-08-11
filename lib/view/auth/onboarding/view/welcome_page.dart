import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:folovmi_app/core/components/animations/easy_in_out.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/view/auth/login/view/login_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_first_page.dart';
import 'package:folovmi_app/view/auth/register/view/terms_of_user_page.dart';
import '../../../../core/components/button/standart_button.dart';
import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/welcome_page_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          _folovmiLogo(size),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstants.LIGHTBLUE,
                  borderRadius: BorderRadiusConstants.HALF_BORDER_RADIUS),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _welcome(),
                    const SizedBox(height: 20),
                    _welcomeText(),
                    const SizedBox(height: 20),
                    _buttons(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  a(BuildContext context) {
    setState(() {});
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        EasyInOutAnimation(
          duration: Duration(milliseconds: 1200),
          child: WelcomePageButton(
            onPressed: ()=>  Navigator.push(
        context, MaterialPageRoute(builder: ((context) => LoginPage()))),
            textColor: ColorConstants.WHITE,
            color: _ColorsConstants.LOGIN_BLUE,
            text: LocaleKeys.signUp_logIn,
          ),
        ),
        EasyInOutAnimation(
          duration: Duration(milliseconds: 1800),
          child: WelcomePageButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => TermsofUserPage()))),
              color: ColorConstants.WHITE,
              text: LocaleKeys.signUp_signUp,
              textColor: _ColorsConstants.LOGIN_BLUE),
        )
      ],
    );
  }

  Texty _welcomeText() {
    return Texty(
      text: LocaleKeys.welcome_text,
      color: ColorConstants.WHITE,
      fontSize: 14,
    );
  }

  Texty _welcome() {
    return Texty(
      text: LocaleKeys.welcome_welcome,
      color: ColorConstants.WHITE,
      fontSize: 32,
    );
  }

  Expanded _folovmiLogo(Size size) {
    return Expanded(
      flex: 4,
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
    );
  }
}

class _ColorsConstants {
  static Color LOGIN_BLUE = HexColor("0A546A");
}
