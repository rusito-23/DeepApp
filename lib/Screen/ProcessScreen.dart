import 'package:flutter/material.dart';
import 'dart:io';
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
                        SubtitleView('Selected Image'),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child:Image.file(
                                _image,
                                fit: BoxFit.cover,
                                width: 300,
                                height: 400,
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: RoundButtonView(
                                Icon(Icons.lens),
                                'Dream!',
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
