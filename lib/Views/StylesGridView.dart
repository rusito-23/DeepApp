import 'package:flutter/material.dart';
import '../Model/StyleModel.dart';
import '../Views/StyleCellView.dart';
import '../Views/LoadingView.dart';
import '../Views/TextViews.dart';


/// Styles Grid View
///
/// Loads and shows information about all available styles.
class StylesGridView extends StatelessWidget {
    StylesGridView(this._snapshot, {Key key}) : super(key: key);
    AsyncSnapshot<List<StyleModel>> _snapshot;
    final double spacing = 1;

    @override
    Widget build(BuildContext context) {
        if (_snapshot.hasData) {
            return SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    crossAxisSpacing: spacing,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                        return StyleCellView(_snapshot.data[index]);
                    },
                    childCount: _snapshot.data.length,
                )
            );
        } else if (_snapshot.hasError) {
            return SliverFillRemaining(child:
                Column(children: [
                    TitleView('Oops!'),
                    SubtitleView('An error occurred while loading the styles'),
                ])
            );
        } else {
            return SliverFillRemaining(
                child: LoadingView(transparent: true)
            );
        }
    }

}
