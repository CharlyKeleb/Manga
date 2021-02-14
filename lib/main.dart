import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga_ui/screens/main_screen.dart';
import 'package:manga_ui/util/constants.dart';
import 'package:manga_ui/util/provider/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: notifier.dark ? Constants.darkTheme : Constants.lightTheme,
          home: MainScreen(),
        );
      }),
    );
  }
}
