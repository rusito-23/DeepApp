import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import './Screen/MainScreen.dart';


/// Main Application.
///
/// Initialize and set the app config.
class DeepApp extends StatelessWidget {

    void setUp() {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
        ));
    }

    ThemeData createTheme() {
        return ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            primaryColor: Colors.white,
            accentColor: Colors.black,
            textTheme: TextTheme(
                headline1: TextStyle(fontSize: 60),
                headline2: TextStyle(fontSize: 20,
                                     fontWeight: FontWeight.w100),
                headline3: TextStyle(fontSize: 15,
                                     fontWeight: FontWeight.w100),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        setUp();

        return MaterialApp(
            title: 'Deep Dream App',
            theme: createTheme(),
            home: MainScreen(),
        );
    }

}
