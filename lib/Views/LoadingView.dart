import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget {

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

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
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
