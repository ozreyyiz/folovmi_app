import 'package:flutter/cupertino.dart';

class BorderRadiusConstants {
  static BorderRadius INTRODUCTION_BORDER_RADIUS = BorderRadius.circular(14);
  static BorderRadius SMALL_BUTTON = BorderRadius.circular(9);
  static BorderRadius HEALTH_MENU_BIG_RADIUS = BorderRadius.circular(21);
  static BorderRadius HEALTH_MENU_RADIUS = BorderRadius.circular(10);
  

  static BorderRadius BORDER_RADIUS_CONTAINER = BorderRadius.circular(36);
  static BorderRadius EKG_CONTAINER_RADIUS = BorderRadius.circular(16);
  static BorderRadius BLOOD_PRESSURE_CONTAINER_RADIUS =
      BorderRadius.circular(10);

  static BorderRadius HALF_BORDER_RADIUS = BorderRadius.only(
      topLeft: Radius.circular(36), topRight: Radius.circular(36));

  static BorderRadius BORDER_RADIUS_SHORT_BODY = BorderRadius.only(
    topLeft: Radius.circular(36),
    topRight: Radius.circular(36),
    bottomLeft: Radius.circular(18),
    bottomRight: Radius.circular(18),
  );

  static BorderRadius BORDER_RADIUS_SHORT_BODY_CONTAINER = BorderRadius.only(
    bottomLeft: Radius.circular(18),
    bottomRight: Radius.circular(18),
  );

  static BorderRadius CONTAINER_TOP_BORDER = BorderRadius.only(
      topLeft: Radius.circular(33), topRight: Radius.circular(33));


      static BorderRadius BODY_TEMPERATURE_CONTAINER_TOP = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  static BorderRadius BODY_TEMPERATURE_CONTAINER_BOTTOM = BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );
}

