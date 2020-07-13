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
        final double spacing = 1;

        return SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: spacing,
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return StyleCellView(styles[index]);
                },
                childCount: styles.length,
            )
        );
    }

}
