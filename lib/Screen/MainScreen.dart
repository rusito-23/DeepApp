import 'package:flutter/material.dart';
import '../Views/TextViews.dart';
import '../Views/StylesGridView.dart';


/// Main Initial Screen
///
/// Shows the app title, description and available styles. 
class MainScreen extends StatefulWidget {
    MainScreen({Key key}) : super(key: key);

    @override
    _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
    ScrollController _scrollController;

    @override
    void initState() {
        super.initState();
        _scrollController = ScrollController()
        ..addListener(() => setState(() {}));
    }

    bool get _showTitle {
        return _scrollController.hasClients
            && _scrollController.offset > 140 - kToolbarHeight;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                    SliverAppBar(
                        pinned: true,
                        expandedHeight: 200,
                        backgroundColor: Colors.transparent,
                        title: _showTitle ? TitleView('Deep App') : null,
                        flexibleSpace: _showTitle ? null : FlexibleSpaceBar(
                            title: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    TitleView('Deep App'),
                                    MainSubtitleView('Select a style to get started!')
                                ]
                            )
                        ),
                      ),
                    StylesGridView(),
                ]
            ) 
        );
    }
}
