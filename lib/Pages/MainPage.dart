import 'package:flutter/material.dart';
import '../Model/StyleModel.dart';
import '../Providers/StyleProvider.dart';


/// Main Initial Page 
///
/// Shows the app title, description and available styles. 
class MainPage extends StatelessWidget {
    MainPage({Key key}) : super(key: key);

    Widget titleWidget(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Text('DEEP APP', style: Theme.of(context).textTheme.headline1)
        );
    }

    Widget stylesCollection(BuildContext context) {
        List<StyleModel> styles = StyleProvider.getStyles();
        styles.forEach((style) => print(style.name));
        return Text('HEY THERE');
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: <Widget>[
                        this.titleWidget(context),
                        this.stylesCollection(context),
                    ],
                ),
            )
        );
    }
}
