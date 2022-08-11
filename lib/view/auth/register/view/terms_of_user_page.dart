import 'package:flutter/material.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/components/button/standart_button.dart';
import 'package:folovmi_app/core/components/input/standart_input_box.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import 'package:folovmi_app/view/auth/register/view/register_first_page.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class TermsofUserPage extends StatefulWidget {
  TermsofUserPage({Key? key}) : super(key: key);

  @override
  State<TermsofUserPage> createState() => _TermsofUserPageState();
}

class _TermsofUserPageState extends State<TermsofUserPage> {
  bool isTurkish = false;
  Color firstButton = ColorConstants.WHITE;
  Color secondButton = ColorConstants.WHITE;
  Color thirdButton = ColorConstants.WHITE;
  bool isFirst = false;
  bool isSecond = false;
  bool isThird = false;
  bool isButton = false;
  buttonFunc() {
    if (isFirst == true && isSecond == true) {
      isButton = true;
    } else {
      isButton = false;
    }
  }

  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isNavigationBar: false,
      isShort: false,
      title: LocaleKeys.user_terms_user_terms,
      viewModel: "",
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: SizeConfig.sizeHeight(context, 0.3),
              width: SizeConfig.sizeWidth(context, 1),
              child: Image.asset("assets/images/terms.jpg"),
            ),
            StandartInputBox(
              contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
              hintText: "Phone Number",
              controller: phoneNumber,
              keyboard: TextInputType.phone,
            ),
            Container(height: SizeConfig.sizeHeight(context, 0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _whyDoWeWantHeader(),
                  _termsOfUserRow(context),
                  _personalDataRow(context),
                  _sms(context),
                  _continueButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Texty _whyDoWeWantHeader() {
    return Texty(
                  text: LocaleKeys.user_terms_why_phone_number,
                  fontSize: 24,
                  color: ColorConstants.BLUE,
                );
  }

  StandartButton _continueButton(BuildContext context) {
    return StandartButton(
        color: isButton ? ColorConstants.BLUE : ColorConstants.GRAY_FONT,
        text: LocaleKeys.user_terms_continue,
        textColor: ColorConstants.WHITE,
        padding: PaddingConstants.BUTTONPADDING,
        width: SizeConfig.sizeWidth(context, 0.6),
        onPressed: () {
          isButton
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterFirstPage()))
              : null;
        });
  }

  Row _sms(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(backgroundColor: thirdButton),
          onPressed: () {
            setState(() {
              isThird = !isThird;
              if (isThird) {
                thirdButton = ColorConstants.GREEN;
              } else {
                thirdButton = ColorConstants.WHITE;
              }

              print(isThird);
            });
          },
          child: Icon(
            Icons.done,
            color: ColorConstants.WHITE,
          ),
        ),
        WidthBox(width: 10),
        SizedBox(
          width: SizeConfig.sizeWidth(context, 0.7),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: LocaleKeys.user_terms_sms_permission.locale,
                  style: TextStyle(
                    color: ColorConstants.BLACK,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Row _personalDataRow(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(backgroundColor: secondButton),
          onPressed: () {
            setState(() {
              isSecond = !isSecond;

              if (isSecond) {
                secondButton = ColorConstants.GREEN;
              } else {
                secondButton = ColorConstants.WHITE;
              }
              buttonFunc();
            });
          },
          child: Icon(
            Icons.done,
            color: ColorConstants.WHITE,
          ),
        ),
        WidthBox(width: 10),
        SizedBox(
          width: SizeConfig.sizeWidth(context, 0.7),
          child: LayoutBuilder(
            builder: (context, constraints) {
              String locale = Localizations.localeOf(context).languageCode;

              if (locale == "tr") {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_first.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_second.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_third.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_first.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_second.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_personal_data_third.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }

  Row _termsOfUserRow(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(backgroundColor: firstButton),
          onPressed: () {
            setState(() {
              isFirst = !isFirst;

              if (isFirst) {
                firstButton = ColorConstants.GREEN;
              } else {
                firstButton = ColorConstants.WHITE;
              }
              buttonFunc();
            });
          },
          child: Icon(
            Icons.done,
            color: ColorConstants.WHITE,
          ),
        ),
        WidthBox(width: 10),
        SizedBox(
          width: SizeConfig.sizeWidth(context, 0.7),
          child: LayoutBuilder(
            builder: (context, constraints) {
              String locale = Localizations.localeOf(context).languageCode;

              if (locale == "tr") {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_first.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_second.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK, fontSize: 15),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_third.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_fourth.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK, fontSize: 15),
                      ),
                    ],
                  ),
                );
              } else {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_first.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_second.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_third.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_fourth.locale,
                        style: TextStyle(
                            color: ColorConstants.BLACK,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: LocaleKeys.user_terms_terms_of_use_fifth.locale,
                        style: TextStyle(
                          color: ColorConstants.BLACK,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
