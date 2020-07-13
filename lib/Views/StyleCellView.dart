import 'package:flutter/material.dart';
import '../Model/StyleModel.dart';
import '../Screen/PickerScreen.dart';
import '../Views/ButtonViews.dart';
import '../Views/TextViews.dart';


/// Style View
///
/// Used to render the style information within the Styles Grid.
class StyleCellView extends StatelessWidget {
    StyleModel _style;
    StyleCellView(this._style);

    Widget styleNameView(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 10),
            child: LabelView(_style.name.toUpperCase()),
        );
    }

    Image styleIcon() {
        return Image.asset(_style.iconPath,
                           fit: BoxFit.fill);
    }

    void showPickerScreen(BuildContext context) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => PickerScreen(_style)));
    }

    @override
    Widget build(BuildContext context) {
        return Center(child:
                RoundButtonView(
                    styleIcon(),
                    _style.name,
                    () => showPickerScreen(context))
        );
    }

}
