import 'package:dragon_trade/models/user.dart';
import 'dart:core';

int calculateTheBalance(){
  double a=0;
  a=((UserData.witchers/10.0)-20).abs()+((UserData.people/10.0)-20).abs()+((UserData.gnomes/10.0)-20).abs()+((UserData.leprecons/10.0)-20).abs()+((UserData.elves/10.0)-20).abs();
a/=10;
return a.ceil();
}