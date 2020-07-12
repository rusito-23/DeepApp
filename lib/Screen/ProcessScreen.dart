import 'package:flutter/material.dart';
import 'dart:io';
import '../Views/TextViews.dart';


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
                    children: <Widget>[
                        SubtitleView('Selected Image'),
                        Image.file(_image),
                    ],
                ),
            )
        );
    }
}
