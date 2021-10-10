import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart';
import 'package:dragon_trade/screens/chapters/chapter_0.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = new TextEditingController();
    TextEditingController controllerNumber = new TextEditingController();
var maskFormatter = new MaskTextInputFormatter(mask: '+7(###)###-##-##', filter: { "#": RegExp(r'[0-9]') });
  @override
  Widget build(BuildContext context) {
    print(controllerNumber.text.length);
    return Scaffold(
     // resizeToAvoidBottomInset:false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 52,
              ),
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
                      labelText: 'Ваше имя',
                      labelStyle: TextStyle(
                          color: Color(0xff333333).withOpacity(0.5),
                          fontSize: 12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: TextField(
                  controller: controllerNumber,
                  style: AppColors.text,
                  inputFormatters: [maskFormatter],
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    
                      focusColor: AppColors.primary,
                      labelText: 'Номер телефона',
                      labelStyle: TextStyle(
                          color: Color(0xff333333).withOpacity(0.5),
                          fontSize: 12)),
                ),
              ),
              BottomButton(
                name: 'Начать',
                width: 148,
                handler: controller.text.isNotEmpty&&controllerNumber.text.length==16
                    ? () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setString('name', controller.text);
                        UserData.name = controller.text;

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Chapter(
                                      chapter: chapterZero0,
                                    )));
                      }
                    : null,
              )
            ],
          ),
        ),
      ), //
    );
  }
}
