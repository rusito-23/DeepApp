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

        final double runSpacing = 1;
        final double spacing = 1;
        final columns = 2;
        final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;

        return Expanded(child:
            Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                    child:Wrap(
                        runSpacing: runSpacing,
                        spacing: spacing,
                        alignment: WrapAlignment.center,
                        children: [
                            for (var style in styles)
                                Container(
                                    width: w,
                                    height: w,
                                    child: StyleCellView(style)
                                )
                        ]
                    )
                )
            )
        );
    }

}
