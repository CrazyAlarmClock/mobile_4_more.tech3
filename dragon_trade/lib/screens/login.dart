import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/svg/violet_dragon.svg'),
            SizedBox(height: 52,),
            Text(
              'Добро пожаловать в Dragon Invest III',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 52,),
             Text(
              'Создай своего героя!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 52,),
            BottomButton(
              name: 'Начать',
              width: 148,
              handler: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home())),
            )
          ],
        ),
      ), //
    );
  }
}