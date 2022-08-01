import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/container/colorful_container.dart';
import 'package:folovmi_app/core/init/lang/locale_keys.g.dart';

import '../../../core/init/extension/string_extension.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends BaseState<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(isShort: true,
        title: "deafult pager",
        viewModel: "",
        onDispose: () {},
        onModelReady: (model) {},
        onPageBuilder: (context, value) => Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ColorfulContainer(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ColorfulContainer(),
                ),
              ],
            ));
  }
}

// Stack(
//           children: [
//             Positioned(
//               right: 0,
//               top: 0,
//               child: Container(
//                 height: sizeHeight(0.15),
//                 width: sizeWidth(1),
//                 color: ColorConstants.PINK,
//                 child: const Center(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       bottom: 25,
//                     ),
//                     child: Text("dsaasdads"),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 70,
//               child: Container(
//                 height: sizeHeight(0.95),
//                 width: sizeWidth(1),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadiusConstants.HALF_BORDER_RADIUS,
//                   color: ColorConstants.WHITE,
//                 ),
//               ),
//             ),
//           ],
//         ),
