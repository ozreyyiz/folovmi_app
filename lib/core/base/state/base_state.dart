import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State <T> {
  ThemeData get themeData => Theme.of(context);

  double sizeHeight(double value)=>MediaQuery.of(context).size.height*value;
  double sizeWidth(double value)=>MediaQuery.of(context).size.width*value;

}