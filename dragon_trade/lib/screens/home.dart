import 'package:dragon_trade/utils/fade_text.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          "TEXT",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SlidingUpPanel(

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        minHeight: 300,
        maxHeight: 600,
        panel: Container(),
        body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.topCenter,
              child:   FadeText(widget: Text('awdawd'),),),
        ),
      ),
    );
  }
}
