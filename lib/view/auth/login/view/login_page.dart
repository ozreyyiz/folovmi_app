import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import 'package:folovmi_app/view/auth/login/view/password_reminder_page.dart';
import 'package:folovmi_app/view/riverpod/riverpod_management.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/components/animations/decelerate.dart';
import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/constants/padding/padding_constants.dart';
import '../../../../core/constants/size/size_config.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../default/view/default_page.dart';
import '../widgets/sign_up_big_button.dart';
import '../widgets/sign_up_input_box.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final box = GetStorage();


  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 40,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/images/Turn Back Icon.svg")),
          ),
          _pictureContainer(context),
          _headerContainer(context),
          _dataField(context),
        ],
      ),
    );
  }

  Positioned _dataField(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: SizeConfig.sizeWidth(context, 1),
        height: SizeConfig.sizeHeight(context, 0.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusConstants.HALF_BORDER_RADIUS,
        ),
        child: Padding(
          padding: PaddingConstants.widePadding,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                _emailField(),
                const SizedBox(height: 10),
                _passwordField(),
                const SizedBox(height: 10),
                _loginButton(context),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                DecelerateAnimation(
                  duration: Duration(milliseconds: 1200),
                  child: GestureDetector(
                    onTap: () {
                      print(box.read("token"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordReminderPage()));
                    },
                    child: Texty(
                      text: LocaleKeys.signUp_forgotPassword,
                      fontSize: 20,
                      color: ColorConstants.BLUE,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _pictureContainer(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
          width: SizeConfig.sizeWidth(context, 1),
          height: SizeConfig.sizeHeight(context, 0.4),
          child: Image.asset("assets/images/login_svg.jpg")),
    );
  }

  DecelerateAnimation _passwordField() {
    return DecelerateAnimation(
      duration: Duration(milliseconds: 800),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : "This field required.",
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        controller: ref.read(loginRiverpod).password,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: (() {
              setState(() {
                obscureText = !obscureText;
              });
            }),
            icon: Icon(Icons.remove_red_eye),
          ),
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.signUp_password.locale,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.INPUT_BOX_BORDER_COLOR,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(33),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.INPUT_BOX_BORDER_COLOR,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(33),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
      ),
    );
  }

  Positioned _headerContainer(BuildContext context) {
    return Positioned(
      top: SizeConfig.sizeHeight(context, 0.4),
      child: Container(
        width: SizeConfig.sizeWidth(context, 1),
        height: SizeConfig.sizeHeight(context, 0.2),
        decoration: BoxDecoration(
          color: ColorConstants.PINK,
          borderRadius: BorderRadiusConstants.HALF_BORDER_RADIUS,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Texty(
              color: ColorConstants.WHITE,
              fontSize: 20,
              text: LocaleKeys.signUp_logIn,
            ),
          ),
        ),
      ),
    );
  }

  DecelerateAnimation _loginButton(BuildContext context) {
    return DecelerateAnimation(
      duration: Duration(milliseconds: 1000),
      child: SignUpBigButton(
        onPressed: () {
          if (ref.read(loginRiverpod).email.text.length < 5) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("data")));
          } else {
            ref.read(loginRiverpod).fetch(context);
          }
        },
        text: LocaleKeys.signUp_logIn,
      ),
    );
  }

  DecelerateAnimation _emailField() {
    
    return DecelerateAnimation(
      duration: Duration(milliseconds: 500),
      child: SignUpInputBox(
        keyboard: TextInputType.emailAddress,
        controller: ref.read(loginRiverpod).email,
        hintText: LocaleKeys.signUp_email,
      ),
    );
  }
}
