import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import './Pages/MainPage.dart';


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
                headline1: TextStyle(fontSize: 60.0),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        this.setUp();

        return MaterialApp(
            title: 'Deep Dream App',
            theme: this.createTheme(),
            home: MainPage(),
        );
    }

}
