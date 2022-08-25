import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/animations/decelerate.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/sign_up_big_button.dart';

class PasswordReminderPage extends StatefulWidget {
  PasswordReminderPage({Key? key}) : super(key: key);

  @override
  State<PasswordReminderPage> createState() => _PasswordReminderPageState();
}

class _PasswordReminderPageState extends BaseState<PasswordReminderPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      isNavigationBar: false,
        isShort: false,
        title: LocaleKeys.signUp_passwordReminder,
        viewModel: "",
        onDispose: () {},
        onModelReady: (model) {},
        onPageBuilder: (context, value) => Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset("assets/images/password_background.png"),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Padding(
                      padding: PaddingConstants.widePadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DecelerateAnimation(
                              duration: Duration(milliseconds: 800),
                              child: _emailTextField()),
                          DecelerateAnimation(
                            duration: Duration(milliseconds: 1000),
                            child: SignUpBigButton(
                              onPressed: a,
                              text: LocaleKeys.signUp_yourPassword,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        DecelerateAnimation(
                          duration: Duration(milliseconds: 1200),
                          child: Texty(
                            text: LocaleKeys.signUp_checkMail,
                            fontSize: 16,
                            color: ColorConstants.BLUE,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }

  void a() {}
  TextField _emailTextField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            right: 8,
            bottom: 8,
            left: 10,
          ),
          child: SvgPicture.asset(
            "assets/images/Group 664.svg",
          ),
        ),
        hintText: LocaleKeys.signUp_email.locale,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
        ),
      ),
    );
  }
}
