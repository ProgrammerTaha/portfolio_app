import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'coolors.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameWidget = 'Taha\nSaad.'
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
        child: VStack(
          [
            ZStack(
              [
                Align(
                  alignment: Alignment.topRight,
                  child: PictureWidget(),
                ),
                Row(
                  children: [
                    VStack(
                      [
                        if (context.isMobile) 50.heightBox else 10.heightBox,
                        CustomAppBar().shimmer(
                          primaryColor: Coolors.accentColor,
                        ),
                        30.heightBox,
                        nameWidget,
                        20.heightBox,
                        VxBox()
                            .color(Coolors.accentColor)
                            .size(60, 10)
                            .make()
                            .shimmer(primaryColor: Coolors.accentColor),
                        30.heightBox,
                        SocilaAccounts(),
                      ],
                    ).pSymmetric(h: context.percentWidth * 10, v: 32),
                    Expanded(
                      child: VxResponsive(
                        fallback: const Offstage(),
                        medium: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        large: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                      ),
                    ),
                  ],
                ).w(context.screenWidth),
              ],
            ),
          ],
        ),
      )
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        'assets/pic3.png',
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(AntDesign.codesquare, size: 50);
  }
}

class SocilaAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch('https://twitter.com/flutterdevtaha');
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.linkedin_square,
        color: Colors.white,
      ).mdClick(() {
        launch('https://www.linkedin.com/in/flutterdevtaha');
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.facebook_square,
        color: Colors.white,
      ).mdClick(() {
        launch('https://www.facebook.com/flutterdevtaha');
      }).make(),
    ].hStack();
  }
}

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "@mobile, desktop, simple web developer with flutter, firebase & dart."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(
                context.isMobile
                    ? context.screenWidth
                    : context.percentWidth * 40,
              ),
          20.heightBox,
        ].vStack(),
        ElevatedButton(
          onPressed: () {
            launch('https://github.com/flutterdevtaha');
          },
          child: Row(children: [
            "Visit my Github ".text.make(),
            Icon(
              AntDesign.github,
              color: Colors.white,
            ).mdClick(() {
              launch('https://github.com/flutterdevtaha');
            }).make(),
          ]),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Coolors.accentColor),
            shape: MaterialStateProperty.all(Vx.roundedSm as OutlinedBorder?),
            overlayColor: MaterialStateProperty.all(Vx.green700),
          ),
        ).h(50),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
