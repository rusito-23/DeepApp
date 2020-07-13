import 'package:flutter/material.dart';


/// Title View
class TitleView extends StatelessWidget {
    final String _title;
    const TitleView(this._title);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.all(10),
            child: Text(_title.toUpperCase(),
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                ),
            )
        );
    }
}

/// Main Subitle View
class MainSubtitleView extends StatelessWidget {
    final String _title;
    const MainSubtitleView(this._title);

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.all(10),
            child: Text(_title.toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                ),
            )
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
