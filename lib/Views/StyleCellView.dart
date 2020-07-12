import 'package:flutter/material.dart';
import '../Model/StyleModel.dart';
import '../Pages/PickerPage.dart';


/// Style View
///
/// Used to render the style information within the Styles Grid.
class StyleCellView extends StatelessWidget {
    StyleModel _style;
    StyleCellView(this._style);

    Widget iconView(BuildContext context) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: GestureDetector(
                child: Image.asset(
                            _style.iconPath,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                ),
                onTap: () => Navigator.push(context,
                                MaterialPageRoute(
                                builder: (context) => PickerPage(_style))),
            )
        );
    }

    Widget styleNameView(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(_style.name.toUpperCase(),
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
