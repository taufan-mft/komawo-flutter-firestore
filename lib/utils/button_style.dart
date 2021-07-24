import 'package:flutter/material.dart';

class MyButtonStyle {

  static ButtonStyle primaryButton(BuildContext context, Color colors) {
    return ElevatedButton.styleFrom(
        primary: colors,
        minimumSize: Size(MediaQuery.of(context).size.width*0.9, 36),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ));
  }
}