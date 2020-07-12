import 'package:flutter/material.dart';
import '../Views/TextViews.dart';


/// Button Round with white borders and image child!
class RoundButtonView extends StatelessWidget {
    final Widget _image;
    final VoidCallback _callback;
    final String _label;
    final double width;
    final double height;
    final double borderRadius;

    RoundButtonView(this._image,
                    this._label,
                    this._callback,
                    { this.width = 100, this.height = 100, this.borderRadius = 80 });

    Widget imageView(BuildContext context) {
        return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                    color: Colors.white,
                    width: 3,
                )
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: _image,
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return  InkWell(
            onTap: _callback,
            borderRadius: BorderRadius.circular(borderRadius),
            splashColor: Colors.black,
            child: Column(
                children: [
                    imageView(context),
                    LabelView(_label)
                ]
            )
        );
    }
}
