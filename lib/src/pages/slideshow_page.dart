import 'package:designs/src/theme/themechanger.dart';
import 'package:designs/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    final children = [
      Expanded(
        child: Slideshow(
          primaryColor: appTheme.darkTheme
              ? appTheme.currentTheme.accentColor
              : Colors.pink,
          primaryBullet: 25,
          dotsOnTop: true,
          slides: <Widget>[
            SvgPicture.asset('assets/svg/1.svg'),
            SvgPicture.asset('assets/svg/2.svg'),
            SvgPicture.asset('assets/svg/3.svg'),
            SvgPicture.asset('assets/svg/4.svg'),
            SvgPicture.asset('assets/svg/3.svg'),
          ],
        ),
      ),
      Expanded(
        child: Slideshow(
          primaryColor: appTheme.darkTheme
              ? appTheme.currentTheme.accentColor
              : Colors.pink,
          primaryBullet: 25,
          dotsOnTop: true,
          slides: <Widget>[
            SvgPicture.asset('assets/svg/1.svg'),
            SvgPicture.asset('assets/svg/2.svg'),
            SvgPicture.asset('assets/svg/3.svg'),
            SvgPicture.asset('assets/svg/4.svg'),
            SvgPicture.asset('assets/svg/3.svg'),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: isLarge
          ? Column(
              children: children,
            )
          : Row(
              children: children,
            ),
    );
  }
}
