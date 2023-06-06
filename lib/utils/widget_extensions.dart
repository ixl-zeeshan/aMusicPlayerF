import 'package:flutter/cupertino.dart';

extension WidgetExtensions on Widget {
  Widget expanded() => Expanded(
        child: this,
      );

  Widget padding({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      ),
      child: this,
    );
  }
}
