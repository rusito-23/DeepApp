import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker_modern/image_picker_modern.dart';
import '../Screen/ProcessScreen.dart';
import '../Views/TextViews.dart';
import '../Views/LoadingView.dart';
import '../Model/StyleModel.dart';


/// Picker Screen
///
/// Shows the option to select a picture from the gallery or the camera.
class PickerScreen extends StatelessWidget {
    StyleModel _style;
    PickerScreen(this._style);

    /// Picker functions

    Future<void> startPicker(BuildContext context, ImageSource source) async {
        var image = await ImagePicker.pickImage(source: source);
        if ( image != null ) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessScreen(image)));
        }
    }
    
    /// Render

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
                    onTap: () => startPicker(context, ImageSource.gallery)
                )),
                Expanded(child:GestureDetector(
                    child: Column(
                            children: [
                                Icon(Icons.photo_camera),
                                LabelView('Camera')
                            ]),
                    onTap: () => startPicker(context, ImageSource.camera)
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
                    SubtitleView('Please select a source to continue'),
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: sourcesButtonsView(context)
                    )
                ]
            )
        );
    }
}
