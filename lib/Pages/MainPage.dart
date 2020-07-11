import 'package:flutter/material.dart';
import '../Views/TitleView.dart';
import '../Views/SubtitleView.dart';
import '../Views/StylesGridView.dart';


/// Main Initial Page 
///
/// Shows the app title, description and available styles. 
class MainPage extends StatelessWidget {
    MainPage({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: <Widget>[
                        TitleView('DEEP APP'),
                        SubtitleView('AVAILABLE STYLES'),
                        StylesGridView(),
                    ],
                ),
            )
        );
    }
}
