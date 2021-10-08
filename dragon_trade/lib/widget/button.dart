import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {
  final String name;
  final Function() handler;
  final Color activeColor;
  final Color textColor;
  final double width;

  BottomButton({
    Key key,
    @required this.name,
    this.handler,
    this.width=double.infinity,
    this.activeColor = const Color(0xff3A83F1),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: textColor,
      minimumSize: Size(width, 52),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      backgroundColor: activeColor
    );
    return Padding(
      padding:  EdgeInsets.all(16.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: handler,
        child: Text(name,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16,fontStyle: FontStyle.normal),),
      ),
    );
  }
}