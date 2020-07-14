import 'package:flutter/material.dart';
import 'dart:io';
import '../Helpers/Strings.dart';
import '../Views/TextViews.dart';
import '../Views/ButtonViews.dart';
import '../Model/StyleModel.dart';
import '../Service/DeepAPIService.dart';


/// Process Screen
///
/// Shows the original image, makes the Deep Dream request and shows the result. 
class ProcessScreen extends StatefulWidget {
    File _image;
    StyleModel _style;
    ProcessScreen(this._image, this._style, {Key key}) : super(key: key);

    @override
    _ProcessScreenState createState() => _ProcessScreenState();
}


class _ProcessScreenState extends State<ProcessScreen> {
    File _dreamed_image;

    Future<void> _dream() async {
        File dreamed = await DeepAPIService.shared.processDream(widget._image, widget._style);
        setState(() {
            _dreamed_image = dreamed;
        });
    }

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
                                    _dreamed_image ?? widget._image,
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
                                _dream,
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
