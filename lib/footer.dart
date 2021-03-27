import 'package:flutter/material.dart';
import 'package:portfolio/coolors.dart';
import 'package:portfolio/header.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterScreen extends StatefulWidget {
  @override
  _FooterScreenState createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  var stringWidget =
      "Need Flutter developer\nLet's talk".text.center.white.xl2.make();

  var contactWidget = "programmer.taha.1y@gmail.com"
      .text
      .color(Coolors.accentColor)
      .semiBold
      .make()
      .box
      .border(color: Coolors.accentColor)
      .p16
      .rounded
      .make();

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              stringWidget,
              10.heightBox,
              contactWidget,
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              stringWidget,
              10.heightBox,
              contactWidget,
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          ).w(context.safePercentWidth * 85).scale150().p16(),
        ),
        50.heightBox,
        CustomAppBar().shimmer(
          primaryColor: Coolors.accentColor,
        ),
        10.heightBox,
        "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["that's all folks".textSpan.gray500.make()]).make(),
        10.heightBox,
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}
