import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/model/dashboard_data_model.dart';
String path="assets/images/";
class DashboardDatas {
  List datas = [

DashboardData(header: LocaleKeys.dashboard_temperature,text: "30.50 C", iconPath: "assets/images/temp_icon.svg"),
DashboardData(header: LocaleKeys.dashboard_humidty,text: "%65.50", iconPath: "assets/images/humidty_icon.svg"),
DashboardData(header: LocaleKeys.dashboard_light,text: "30 Lux", iconPath: "assets/images/light_icon.svg"),
DashboardData(header: LocaleKeys.dashboard_co2,text: "Alarm", iconPath: "assets/images/co2_icon.svg"),
DashboardData(header: LocaleKeys.dashboard_pm10,text: "Normal", iconPath: "assets/images/pm10_icon.svg"),
DashboardData(header: LocaleKeys.dashboard_pm2_5,text: "Normal", iconPath: "assets/images/pm25_icon.svg"),



        
  ];
}