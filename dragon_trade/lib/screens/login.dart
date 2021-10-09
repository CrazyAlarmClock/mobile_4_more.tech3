import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart';
import 'package:dragon_trade/screens/chapters/chapter_0.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset:false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimationRive(animation: '1',),
            SizedBox(
              height: 52,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Добро пожаловать в Dragon Invest III',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              height: 52,
            ),
            Text(
              'Создай своего героя!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 52,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextField(
                controller: controller,
                style: AppColors.text,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    focusColor: AppColors.primary,
                    labelText: 'Как звать тебя странник?',
                    labelStyle: TextStyle(
                        color: Color(0xff333333).withOpacity(0.5),
                        fontSize: 12)),
              ),
            ),
            BottomButton(
              name: 'Начать',
              width: 148,
              handler: controller.text.isNotEmpty
                  ? () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setString('name', controller.text);
                      UserData.name = controller.text;

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chapter(
                                    chapter: chapterZero,
                                  )));
                    }
                  : null,
            )
          ],
        ),
      ), //
    );
  }
}
