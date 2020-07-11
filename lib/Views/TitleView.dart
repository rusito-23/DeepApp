import 'package:flutter/material.dart';


/// Title View
///
/// Shows the main app title. 
class TitleView extends StatelessWidget {
    String title;
    TitleView(this.title);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 60),
            child: Text(title, style: Theme.of(context).textTheme.headline1)
        );
    }
}
