import 'package:flutter/material.dart';
import '../Views/TextViews.dart';
import '../Views/StylesGridView.dart';


/// Main Initial Screen
///
/// Shows the app title, description and available styles. 
class MainScreen extends StatelessWidget {
    MainScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: <Widget>[
                        TitleView('Deep App'),
                        SubtitleView('Available Styles'),
                        StylesGridView(),
                    ],
                ),
            )
        );
    }
}
