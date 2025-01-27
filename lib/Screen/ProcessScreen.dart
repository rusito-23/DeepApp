import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import '../Helpers/Strings.dart';
import '../Views/TextViews.dart';
import '../Views/ButtonViews.dart';
import '../Views/LoadingView.dart';
import '../Views/ErrorView.dart';
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
    DeepAPIResult _result;
    bool _error = false;

    Future<void> _dream(BuildContext context) async {
        LoadingView.startLoading(context);
        _error = false;
        await DeepAPIService.shared.processDream(widget._image, widget._style)
        .then((DeepAPIResult result) {
            // on dream sucess
            setState(() {
                _error = false;
                _result = result;
            });
        }).catchError((error) {
            // on dream error
            setState(() {
                _error = true;
                _result = null;
            });
        }).whenComplete(() {
            LoadingView.stopLoading(context);
        });
    }

    Future<void> _share(BuildContext context) async {
        LoadingView.startLoading(context);
        await WcFlutterShare
        .share(
            sharePopupTitle: PopUp.SHARE,
            fileName: 'dream.jpeg',
            mimeType: 'image/jpeg',
            bytesOfFile: await _result.image.readAsBytes())
        .catchError((error) {
            // on dream error
            setState(() {
                _error = true;
                _result = null;
            });
        }).whenComplete(() {
            LoadingView.stopLoading(context);
        });
    }

    @override
    Widget build(BuildContext context) {
        if (_error) {
            return ErrorView(Errors.DREAM_ERROR);
        }

        return Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Material(
                                child: Image.file(
                                    _result?.image ?? widget._image,
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height * 0.7,
                                ),
                                clipBehavior: Clip.antiAlias,
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Expanded(child: RoundButtonView(
                                        Icon(Icons.blur_on),
                                        Buttons.DREAM,
                                        () => _dream(context),
                                        height: 50,
                                        width: 50,
                                    )),
                                    Expanded(child: RoundButtonView(
                                        Icon(Icons.blur_on),
                                        Buttons.SHARE,
                                        () => _share(context),
                                        height: 50,
                                        width: 50,
                                        active: _result != null,
                                    )),
                                ]
                            ) 
                        )
                    ],
                ),
            )
        );
    }
}
