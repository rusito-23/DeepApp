import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
    MainPage({Key key}) : super(key: key);

    Widget titleWidget(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Text('DEEP APP', style: Theme.of(context).textTheme.headline1)
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    children: <Widget>[
                        this.titleWidget(context),
                    ],
                ),
            )
        );
    }
}
