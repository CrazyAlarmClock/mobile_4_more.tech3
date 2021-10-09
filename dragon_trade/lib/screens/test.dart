import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart';
import 'package:dragon_trade/screens/chapters/chapter_0.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimationRive extends StatefulWidget {
  final String animation;

  const AnimationRive({Key key, this.animation}) : super(key: key);
  @override
  _AnimationRiveState createState() => _AnimationRiveState();
}

class _AnimationRiveState extends State<AnimationRive> {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/rive/ill-${widget.animation}.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Animation 1'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500, height: 210, child: Rive(artboard: _riveArtboard));
  }
}
