import 'package:flutter/material.dart';
import 'package:folovmi_app/core/components/container/colorful_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/view/auth/register/view/register_first_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_second_page.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/padding/padding_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/register_selected_button.dart';
import '../widgets/register_unselected_button.dart';

class RegisterThirdPage extends StatefulWidget {
  RegisterThirdPage({Key? key}) : super(key: key);

  @override
  State<RegisterThirdPage> createState() => _RegisterThirdPageState();
}

class _RegisterThirdPageState extends State<RegisterThirdPage> {
  bool isSmoke = false;
  bool isDiabetesStaff = false;
  bool isDiabetesFamily = false;
  bool isHearthAttack = false;
  bool isHypertension = false;
  bool isDiseaseCure = false;
  bool isBlind = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      sign: true,
      isShort: true,
      title: LocaleKeys.register_register,
      viewModel: "",
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.widePadding,
        child: Column(
          children: [
            _pageNumber(),
            SizedBox(height: 30),
            Column(
              children: [
                Row(
                  children: [
                    Text("dsasdasdaasd"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_smoke,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isSmoke,
                      onChanged: (value) {
                        setState(() {
                          isSmoke = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_diabetes_staff,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isDiabetesStaff,
                      onChanged: (value) {
                        setState(() {
                          isDiabetesStaff = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_diabetes_family,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isDiabetesFamily,
                      onChanged: (value) {
                        setState(() {
                          isDiabetesFamily = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_hearth_attack,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isHearthAttack,
                      onChanged: (value) {
                        setState(() {
                          isHearthAttack = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_hypertension,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isHypertension,
                      onChanged: (value) {
                        setState(() {
                          isHypertension = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_disease_cure,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isDiseaseCure,
                      onChanged: (value) {
                        setState(() {
                          isDiseaseCure = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texty(
                        text: LocaleKeys.register_blind,
                        fontSize: 15,
                        color: ColorConstants.GRAY_FONT),
                    Switch(
                      value: isBlind,
                      onChanged: (value) {
                        setState(() {
                          isBlind = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _pageNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RegisterUnselectedButton(
          number: LocaleKeys.register_1,
          widget: RegisterFirstPage(),
        ),
        RegisterUnselectedButton(
          number: LocaleKeys.register_2,
          widget: RegisterSecondPage(),
        ),
        RegisterSelectedButton(number: LocaleKeys.register_3),
      ],
    );
  }
}
