import 'package:flutter/material.dart';
import './MainPage.dart';


class DeepApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Deep Dream App',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainPage(title: 'Deep App!'),
        );
    }

}
