import 'package:flutter/material.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';
import 'package:folovmi_app/view/auth/register/view/register_first_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_third_page.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/input/standart_input_box.dart';
import '../../../../core/constants/padding/padding_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/register_selected_button.dart';
import '../widgets/register_unselected_button.dart';

class RegisterSecondPage extends StatefulWidget {
  RegisterSecondPage({Key? key}) : super(key: key);

  @override
  State<RegisterSecondPage> createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends BaseState<RegisterSecondPage> {
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
          ],
        ),
      ),
    );
  }
}

Row _pageNumber() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RegisterUnselectedButton(
        number: LocaleKeys.register_1,
        widget: RegisterFirstPage(),
      ),
      RegisterSelectedButton(number: LocaleKeys.register_2),
      RegisterUnselectedButton(
        number: LocaleKeys.register_3,
        widget: RegisterThirdPage(),
      ),
    ],
  );
}
