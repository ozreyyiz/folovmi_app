
import 'package:folovmi_app/view/home/settings/wifi_settings/view/wifi_connection_page.dart';
import 'package:folovmi_app/view/home/smart_devices/model/smart_device_model.dart';

import '../../smart_devices/health_monitor/view/ekg_page.dart';
import '../../smart_devices/health_monitor/view/health_monitor_settings_page.dart';

class SmartDevices {
  List smart_devices = [
    SmartDeviceModel("Smart Watch", "assets/images/watch.svg", EKGPage()),
    SmartDeviceModel(
        "Smart Health Monitor", "assets/images/smart_health_monitor.svg", HealthMonitorSettingsPage()),
    SmartDeviceModel("Multi", "assets/images/multi.svg", WifiConnetionPage()),
    SmartDeviceModel("Smart Socket", "assets/images/smart_socket.svg", EKGPage()),
      SmartDeviceModel("Smart Watch", "assets/images/watch.svg", EKGPage()),
    SmartDeviceModel(
        "Smart Health Monitor", "assets/images/smart_health_monitor.svg", HealthMonitorSettingsPage()),
    SmartDeviceModel("Multi", "assets/images/multi.svg", WifiConnetionPage()),
    SmartDeviceModel("Smart Socket", "assets/images/smart_socket.svg", EKGPage()),
    SmartDeviceModel("Smart Watch", "assets/images/watch.svg", EKGPage()),
    SmartDeviceModel(
        "Smart Health Monitor", "assets/images/smart_health_monitor.svg", HealthMonitorSettingsPage()),
    SmartDeviceModel("Multi", "assets/images/multi.svg", WifiConnetionPage()),
    SmartDeviceModel("Smart Socket", "assets/images/smart_socket.svg", EKGPage()),
      SmartDeviceModel("Smart Watch", "assets/images/watch.svg", EKGPage()),
    SmartDeviceModel(
        "Smart Health Monitor", "assets/images/smart_health_monitor.svg", HealthMonitorSettingsPage()),
    SmartDeviceModel("Multi", "assets/images/multi.svg", WifiConnetionPage()),
    SmartDeviceModel("Smart Socket", "assets/images/smart_socket.svg", EKGPage()),

        
  ];
}
