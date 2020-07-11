import 'package:flutter/material.dart';
import '../Model/StyleModel.dart';


/// Style View
///
/// Used to render the style information within the Styles Grid.
class StyleCellView extends StatelessWidget {
    StyleModel style;
    StyleCellView(this.style);

    Widget iconView(BuildContext context) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
                style.iconPath,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
            ),
        );
    }

    Widget styleNameView(BuildContext context) {
        return Container(
            child: Text(style.name,
                        style: Theme.of(context).textTheme.headline3)
        );
    }

    @override
    Widget build(BuildContext context) {
        return Center(child:
            Column(children: <Widget>[
                iconView(context),
                styleNameView(context),
            ])
        );
    }

}