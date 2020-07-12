import 'dart:io';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:flutter/material.dart';
import '../Views/TextViews.dart';
import '../Views/LoadingView.dart';
import '../Model/StyleModel.dart';


class PickerPage extends StatefulWidget {
    StyleModel _style;
    PickerPage(this._style);

    
    @override
    _PickerPageState createState() => _PickerPageState(this._style);
}

class _PickerPageState extends State<PickerPage> {
    File _image;
    StyleModel _style;
    _PickerPageState(this._style);

    /// Picker functions

    Future<void> startGalleryPicker(BuildContext context) async {
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
            _image = image;
        });
    }
    
    Future<void> startCameraPicker(BuildContext context) async {
        var image = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
            _image = image;
        });
    }

    /// Render


    Widget imageView() {
        return _image == null ?
                    SubtitleView('Please select a source to continue') :
                    Image.file(
                        _image,
                        fit: BoxFit.contain,
                        width: 400,
                        height: 400
                    );
    }

    Widget buttonView(BuildContext context) {
        return _image == null ?
                    sourcesButtonsView(context) :
                    continueButtonView(context);
    }

    Widget continueButtonView(BuildContext context) {
        return GestureDetector(
                child: LabelView('Continue'),
                onTap: () => print('Hello world!')
        );
    }

    Widget sourcesButtonsView(BuildContext context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Expanded(child:GestureDetector(
                    child: Column(
                            children: [
                                Icon(Icons.photo_library),
                                LabelView('Library')
                            ]),
                    onTap: () => startGalleryPicker(context)
                )),
                Expanded(child:GestureDetector(
                    child: Column(
                            children: [
                                Icon(Icons.photo_camera),
                                LabelView('Camera')
                            ]),
                    onTap: () => startCameraPicker(context)
                )),
            ]
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        SubtitleView('You selected style'),
                        LargeTextView(_style.name),
                        imageView(),
                        Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: buttonView(context)
                        )
                ])
        );
    }
}
