import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

class BloodPressureThird extends StatefulWidget {
  BloodPressureThird({Key? key}) : super(key: key);

  @override
  State<BloodPressureThird> createState() => _BloodPressureThirdState();
}

class _BloodPressureThirdState extends State<BloodPressureThird> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.blood_pressure_blood_pressure,
      isShort: true,
      isMain: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Column(),
    );
  }
}