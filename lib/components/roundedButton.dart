import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final colorofButton;
  final text;
  final Function onPressed;

  const RoundedButton(
      {@required this.colorofButton,
      @required this.text,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colorofButton,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
