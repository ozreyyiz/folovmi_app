import 'package:flutter/material.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/input/standart_input_box.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/view/auth/register/view/register_second_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_third_page.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/register_selected_button.dart';
import '../widgets/register_unselected_button.dart';

class RegisterFirstPage extends StatefulWidget {
  RegisterFirstPage({Key? key}) : super(key: key);

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends BaseState<RegisterFirstPage> {
  TextEditingController def = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
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
            _inputFields(),
          ],
        ),
      ),
    );
  }

  Column _inputFields() {
    return Column(
      children: [
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_email,
        ),
        SizedBox(height: 10),
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_name,
        ),
        SizedBox(height: 10),
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_surname,
        ),
        SizedBox(height: 10),
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_phone,
        ),
        SizedBox(height: 10),
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_id,
        ),
        SizedBox(height: 10),
        StandartInputBox(
          keyboard: TextInputType.emailAddress,
          controller: def,
          contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
          hintText: LocaleKeys.register_birth,
        ),
      ],
    );
  }

  Row _pageNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RegisterSelectedButton(
          number: LocaleKeys.register_1,
        ),
        RegisterUnselectedButton(
          number: LocaleKeys.register_2,
          widget: RegisterSecondPage(),
        ),
        RegisterUnselectedButton(
          number: LocaleKeys.register_3,
          widget: RegisterThirdPage(),
        ),
      ],
    );
  }
}
