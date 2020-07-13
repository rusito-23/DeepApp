import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget {
    bool transparent;
    LoadingView({this.transparent = false});

    static void startLoading(BuildContext context) {
        Navigator.of(context).push(PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
                return LoadingView();
            }
        ));
    }

    static void stopLoading(BuildContext context) {
        Navigator.of(context).pop();
    }

    BoxDecoration decoration() {
        return transparent ? 
                null :
                BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5));
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: decoration(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                    )
                ]
            )
        );
    }


}
