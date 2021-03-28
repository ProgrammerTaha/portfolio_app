import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'coolors.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.green700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "All Works,\n"
              .richText
              .withTextSpanChildren(
                  ["Selected projects".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(
                    title: 'Recipes app',
                    func: () {
                      launch(
                        'https://drive.google.com/file/d/1eHvpLLpjp6aeNgFiHthtP8jVV9WDBTUM/view?usp=sharing',
                      );
                    }),
                ProjectWidget(
                    title: 'Quizes app',
                    func: () {
                      launch(
                        'https://drive.google.com/file/d/1ZDmdYHt4x8N5a4x7DW7R-Wo_wn54O8-C/view?usp=sharing',
                      );
                    }),
                ProjectWidget(
                    title: 'expanses tracker',
                    func: () {
                      launch(
                        'https://drive.google.com/file/d/1VK0PjWKlP0crSxtYInNteF5oQfson6iY/view?usp=sharing',
                      );
                    }),
                ProjectWidget(
                    title: 'Portfolio App',
                    func: () {
                      launch(
                        'https://drive.google.com/file/d/10lijCHv-3Wnjk3ix4rOxDbp8YjGnigSD/view?usp=sharing',
                      );
                    }),

                // ProjectWidget(
                //     title: 'Shop app',
                //     func: () {
                //       launch('');
                //     }),
                // ProjectWidget(
                //     title: 'Chat app',
                //     func: () {
                //       launch('');
                //     }),
                // ProjectWidget(
                //     title: 'Great places app',
                //     func: () {
                //       launch('');
                //     }),
              ],
              height: 170,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  final func;

  const ProjectWidget({required this.title, required this.func});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(Vx.roundedSm as OutlinedBorder?),
            overlayColor: MaterialStateProperty.all(Coolors.secondaryColor),
          ),
          onPressed: func,
          child: title.text.bold.white.xl.wide.center
              .make()
              .box
              .p8
              .roundedLg
              .alignCenter
              // .square(200)
              .neumorphic(
                  color: Vx.green700, elevation: 5.0, curve: VxCurve.flat)
              .make(),
        ),
        ElevatedButton(
          onPressed: func,
          child: Text('Download'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(Vx.roundedSm as OutlinedBorder?),
            overlayColor: MaterialStateProperty.all(Coolors.secondaryColor),
          ),
        ),
      ],
    );
  }
}
