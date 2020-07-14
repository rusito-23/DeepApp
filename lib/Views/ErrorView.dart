import 'package:flutter/material.dart';
import '../Helpers/Strings.dart';
import '../Views/TextViews.dart';


class ErrorView extends StatelessWidget {
    ErrorView(this.message, {Key key}): super(key: key);
    String message;

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Icon(
                    Icons.error,
                    size: 40,
                ),
                TitleView(Errors.OOPS),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: SubtitleView(message),
                )
            ]
        );
    }
}
