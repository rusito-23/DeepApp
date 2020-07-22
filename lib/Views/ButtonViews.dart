import 'package:flutter/material.dart';
import '../Views/TextViews.dart';


/// Button Round with white borders and image child!
class RoundButtonView extends StatefulWidget {

    /// Initialization

    final Widget _image;
    final VoidCallback _callback;
    final String _label;
    final double width;
    final double height;
    final double borderRadius;
    final bool active;

    RoundButtonView(this._image,
                    this._label,
                    this._callback,
                    {
                        this.width = 100,
                        this.height = 100,
                        this.borderRadius = 80,
                        this.active = true,
                    });

    @override
    _RoundButtonViewState createState() => _RoundButtonViewState();
}


class _RoundButtonViewState extends State<RoundButtonView> {
    bool _tapped = false;

    void onTap() {
        setState(() {
            _tapped = !_tapped;
        });
    }

    Widget imageView(BuildContext context) {
        return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                    color: _tapped ? Colors.grey : (widget.active ? Colors.white: Colors.grey),
                    width: 3,
                )
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: widget._image,
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: widget.active ? widget._callback : () {},
            onTapDown: (_) => onTap(),
            onTapUp: (_) => onTap(),
            onTapCancel: () => onTap(),
            child: Column(
                children: [
                    imageView(context),
                    LabelView(widget._label)
                ]
            )
        );
    }

}
