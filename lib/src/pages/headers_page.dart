import 'package:designs/src/theme/themechanger.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body: CurveHeaderTwo(
        color: appTheme,
      ),
    );
  }
}
