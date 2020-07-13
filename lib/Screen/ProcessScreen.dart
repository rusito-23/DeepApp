import 'package:flutter/material.dart';
import 'dart:io';
import '../Helpers/Strings.dart';
import '../Views/TextViews.dart';
import '../Views/ButtonViews.dart';


/// Process Screen
///
/// Shows the original image, makes the Deep Dream request and shows the result. 
class ProcessScreen extends StatelessWidget {
    File _image;
    ProcessScreen(this._image, {Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Material(
                                child: Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                    width: 300,
                                    height: 400,
                                ),
                                elevation: 30,
                                clipBehavior: Clip.antiAlias,
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: RoundButtonView(
                                Icon(Icons.blur_on),
                                Buttons.DREAM,
                                () => print('Deep dream'),
                                height: 50,
                                width: 50,
                            )
                        )
                    ],
                ),
            )
        );
    }
}
