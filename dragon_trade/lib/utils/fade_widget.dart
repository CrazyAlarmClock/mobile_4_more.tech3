import 'package:flutter/cupertino.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class FadeWidget extends StatelessWidget {
  final Widget widget;

  const FadeWidget({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: widget,
      // Optional paramaters
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeIn,
    );
  }
}
