import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';


class ChapterModel{
  final String name;
  final Widget text;
  final List<BottomButton> buttons;
  ChapterModel({this.name,this.buttons,this.text});
}