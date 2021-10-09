import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chapter extends StatefulWidget {
  final Function go;
  final bool done;
  final String title;
  final String image;
  final Color colorBck;
  final Color txtColor;
  final int lostMoney;

  const Chapter(
      {Key key,
      this.title,
      this.image,
      this.colorBck,
      this.done,
      this.go,
      this.txtColor,
      this.lostMoney})
      : super(key: key);
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.go,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: widget.colorBck,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 108,
                width: 240,
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: widget.txtColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '${widget.lostMoney} монет',
                      style: TextStyle(
                          color: widget.txtColor.withOpacity(0.7),
                          fontSize: 19,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Image.asset(widget.image, scale: 2,),
              )
            ],
          ),
        ),
       widget.done ? Container(
          padding:EdgeInsets.all(16) ,
          alignment: Alignment.centerRight,
          child: Positioned(
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color:  widget.txtColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: SvgPicture.asset('assets/svg/check.svg'),
              ),
            ),
          ),
        ) : Container(),
      ]),
    );
  }
}
