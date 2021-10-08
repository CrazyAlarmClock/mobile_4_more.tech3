import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chapter extends StatefulWidget {
  final Function go;
  final bool locked;
  final String title;
  final String image;
  final Color colorBck;

  const Chapter(
      {Key key, this.title, this.image, this.colorBck, this.locked, this.go})
      : super(key: key);
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: widget.colorBck,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 108,
              width: 200,
              padding: EdgeInsets.all(16),
              alignment: Alignment.topLeft,
              child: Text(
                widget.title,
                style: AppColors.bold,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(widget.image),
            )
          ],
        ),
      ),
      Container(
        height: 108,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(widget.locked ? 0.0 : 0.3),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ]);
  }
}
