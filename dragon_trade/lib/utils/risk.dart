import 'package:dragon_trade/models/user.dart';

int calculateLevelOfRisk(){
  double a=1*UserData.elves+0.4*UserData.people+0.6*(UserData.witchers+UserData.gnomes+UserData.leprecons);
  a/=100;
  UserData.risk=a.ceil();
  return a.ceil();
}