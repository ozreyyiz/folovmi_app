import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/core/constants/app/app_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
import 'package:folovmi_app/view/auth/login/view/login_page.dart';
import 'package:folovmi_app/view/auth/onboarding/view/first_page.dart';
import 'package:folovmi_app/view/auth/onboarding/view/welcome_page.dart';
import 'package:folovmi_app/view/auth/onboarding/widgets/first_page_circle_widget.dart';
import 'package:folovmi_app/view/auth/register/view/register_first_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_second_page.dart';
import 'package:folovmi_app/view/auth/register/view/register_third_page.dart';
import 'package:folovmi_app/view/auth/register/view/sign_up_page.dart';
import 'package:folovmi_app/view/auth/register/view/terms_of_user_page.dart';
import 'package:folovmi_app/view/home/main_page/view/home_page.dart';
import 'package:folovmi_app/view/home/settings/wifi_settings/view/device_reset.dart';
import 'package:folovmi_app/view/home/settings/wifi_settings/view/wifi_connection_page.dart';
import 'package:folovmi_app/view/home/settings/wifi_settings/view/wifi_networks_page.dart';
import 'package:folovmi_app/view/home/smart_devices/blood_temperature/blood_pressure_first.dart';
import 'package:folovmi_app/view/home/smart_devices/body_temperature/body_temperature_second.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/view/dashboard_page.dart';
import 'package:folovmi_app/view/home/smart_devices/smart_devices/view/smart_devices_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: [
          AppConstants.TR_LOCALE,
          AppConstants.EN_LOCALE,
        ],
        path: AppConstants.LANGUAGE_PATH,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Folovmi App Demo',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(Color(0xFFF1FBBEB)),
      ),
      home: DashboardPage(),
    );
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
