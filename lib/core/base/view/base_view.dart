import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/view/home/main_page/service/user_data_service.dart';
import 'package:folovmi_app/view/home/main_page/view/home_page.dart';
import 'package:folovmi_app/view/home/smart_devices/dashboard/view/dashboard_page.dart';

class BaseView<T> extends StatefulWidget {
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Widget appBar;
  final String title;
  final bool isShort;
  final bool sign;
  final bool isMain;
  final bool isNavigationBar;
  final bool isTurnBackIcon;

  const BaseView({
    super.key,
    required this.viewModel,
    required this.onModelReady,
    required this.onDispose,
    required this.onPageBuilder,
    required this.title,
    required this.isShort,
    this.sign = false,
    this.appBar = const Center(),
    this.isMain = false,
    this.isNavigationBar = true,
    this.isTurnBackIcon = true,
  });

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends BaseState<BaseView> {
  int index = 0;
  List screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    DashboardPage(),
    HomePage(),
  ];
  @override
  void initState() {
    super.initState();
    UserDataService().getData();
    if (widget.onModelReady != null) widget.onModelReady(widget.viewModel);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstants.BLUE,
      child: Scaffold(
        backgroundColor: ColorConstants.BLUE,
        body: Stack(
          children: [
            Stack(
              children: [
                _appBar(),
                widget.isTurnBackIcon ? _turnBackIcon() : SizedBox(),
                widget.isShort ? _bodyShort(context) : _bodyLong(context),
                widget.sign ? _signInUpdate() : const Center(),
                widget.isNavigationBar ? _navigationBar(context) : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned _navigationBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        color: ColorConstants.WHITE,
        height: SizeConfig.sizeHeight(context, .09),
        width: SizeConfig.sizeWidth(context, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage()))),
              child: Padding(
                padding: PaddingConstants.NAVIGATION_BAR_ICON_PADDING,
                child:
                    SvgPicture.asset("assets/images/navigation_bar_home.svg"),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => DashboardPage()))),
              child: Padding(
                padding: PaddingConstants.NAVIGATION_BAR_ICON_PADDING,
                child: SvgPicture.asset(
                  "assets/images/navigation_bar_level_icon.svg",
                  color: ColorConstants.BLUE,
                ),
              ),
            ),
            Padding(
              padding: PaddingConstants.NAVIGATION_BAR_ICON_PADDING,
              child: SvgPicture.asset(
                  "assets/images/navigation_bar_time_icon.svg"),
            ),
            Padding(
              padding: PaddingConstants.NAVIGATION_BAR_ICON_PADDING,
              child: SvgPicture.asset(
                "assets/images/navigation_bar_dashboard.svg",
                height: 30,
                color: ColorConstants.BLUE,
              ),
            ),
            Padding(
              padding: PaddingConstants.NAVIGATION_BAR_ICON_PADDING,
              child: SvgPicture.asset(
                "assets/images/navigation_bar_menu.svg",
                color: ColorConstants.BLUE,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _signInUpdate() {
    return Positioned(
      bottom: 10,
      child: Container(
        height: sizeHeight(0.05),
        width: sizeWidth(1),
        child: Center(
          child: Texty(
            color: ColorConstants.WHITE,
            fontSize: 20,
            text: "Sign Up / Update",
          ),
        ),
      ),
    );
  }

  Positioned _appBar() {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        height: sizeHeight(0.16),
        width: sizeWidth(1),
        color: ColorConstants.PINK,
        child: widget.isMain
            ? widget.appBar
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Texty(
                      text: widget.title,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _turnBackIcon() {
    return Positioned(
      top: 40,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          "assets/images/Turn Back Icon.svg",
          color: ColorConstants.WHITE,
        ),
      ),
    );
  }

  Positioned _bodyLong(BuildContext context) {
    return Positioned(
      top: 80,
      child: Container(
        height: sizeHeight(0.9),
        width: sizeWidth(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusConstants.HALF_BORDER_RADIUS,
          color: ColorConstants.WHITE,
        ),
        child: widget.onPageBuilder(context, widget.viewModel),
      ),
    );
  }

  Positioned _bodyShort(BuildContext context) {
    return Positioned(
      top: 80,
      child: Container(
        height: sizeHeight(0.75),
        width: sizeWidth(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusConstants.BORDER_RADIUS_SHORT_BODY,
            color: ColorConstants.WHITE,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 54, 88, 116),
                offset: const Offset(
                  0.0,
                  2.5,
                ),
                blurRadius: 5.0,
                spreadRadius: 0.0,
              ),
            ]),
        child: SingleChildScrollView(
            child: Container(
                child: widget.onPageBuilder(context, widget.viewModel))),
      ),
    );
  }
}




// widget.onPageBuilder(context, widget.viewModel





// widget.onPageBuilder(context, widget.viewModel);
