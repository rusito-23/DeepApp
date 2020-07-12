import 'package:flutter/material.dart';


/// Title View
class TitleView extends StatelessWidget {
    String _title;
    TitleView(this._title);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 60),
            child: Text(_title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1)
        );
    }
}

/// Large Text View
class LargeTextView extends StatelessWidget {
    String _title;
    LargeTextView(this._title);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(_title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1)
        );
    }
}


/// SubTitle View
class SubtitleView extends StatelessWidget {
    String _text;
    SubtitleView(this._text);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(_text.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2)
        );
    }
}


/// Label View
class LabelView extends StatelessWidget {
    String _text;
    LabelView(this._text);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(_text.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3)
        );
    }
}
