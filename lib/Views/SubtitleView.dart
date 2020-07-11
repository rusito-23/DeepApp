import 'package:flutter/material.dart';


/// SubTitle View
class SubtitleView extends StatelessWidget {
    String text;
    SubtitleView(this.text);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(text, style: Theme.of(context).textTheme.headline2)
        );
    }
}
