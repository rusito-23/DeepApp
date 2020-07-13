import 'package:flutter/material.dart';
import '../Helpers/Strings.dart';
import '../Service/DeepAPIService.dart';
import '../Model/StyleModel.dart';
import '../Views/TextViews.dart';
import '../Views/StylesGridView.dart';
import '../Views/LoadingView.dart';


/// Main Initial Screen
///
/// Shows the app title, description and available styles. 
/// Responsible for loading the styles, loading view and error view.
class MainScreen extends StatefulWidget {
    MainScreen({Key key}) : super(key: key);

    @override
    _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
    ScrollController _scrollController;
    Future<List<StyleModel>> _styles;

    @override
    void initState() {
        super.initState();
        _scrollController = ScrollController()
        ..addListener(() => setState(() {}));
        _styles = DeepAPIService.shared.getStyles();
    }

    bool get _showTitle {
        return _scrollController.hasClients
            && _scrollController.offset > 120 - kToolbarHeight;
    }

    @override
    Widget build(BuildContext context) {
        return FutureBuilder<List<StyleModel>>(
            future: _styles,
            builder: (context, snapshot) {
                return Scaffold(
                    body: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                        SliverAppBar(
                            pinned: true,
                            expandedHeight: 160,
                            backgroundColor: Colors.transparent,
                            title: _showTitle ? TitleView(Titles.MAIN_SCREEN_TITLE) : null,
                            flexibleSpace: _showTitle ? null : FlexibleSpaceBar(
                                title: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        TitleView(Titles.MAIN_SCREEN_TITLE),
                                        MainSubtitleView(Titles.MAIN_SCREEN_SUBTITLE)
                                    ]
                                )
                            ),
                        ),
                        StylesGridView(snapshot),
                    ])
                );
            }
        );
    }
}
