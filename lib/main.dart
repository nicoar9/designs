import 'package:designs/src/models/layout_model.dart';
import 'package:designs/src/pages/launcher_page.dart';
import 'package:designs/src/pages/launcher_tablet_page.dart';
import 'package:designs/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => LayoutModel(),
        child: ChangeNotifierProvider(
          create: (_) => ThemeChanger(2),
          child: MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Design App',
      theme: currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          }
          return LauncherPage();
        },
      ),
    );
  }
}
