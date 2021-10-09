import 'package:flutter/cupertino.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class FadeWidget extends StatefulWidget {
  final Widget widget;

  const FadeWidget({Key key, this.widget}) : super(key: key);

  @override
  State<FadeWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: widget.widget,
      // Optional paramaters
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeIn,
    );
  }
}
