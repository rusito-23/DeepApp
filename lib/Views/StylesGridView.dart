import 'package:flutter/material.dart';
import '../Providers/StyleProvider.dart';
import '../Model/StyleModel.dart';
import '../Views/StyleCellView.dart';


/// Styles Grid View
///
/// Loads and shows information about all available styles.
class StylesGridView extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        List<StyleModel> styles = StyleProvider.getStyles();

        return Expanded(child:
            Container(
                alignment: Alignment.center,
                child: GridView.count(
                    childAspectRatio: 4/3,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [for (var style in styles) StyleCellView(style)]
                )
            )
        );
    }

}
