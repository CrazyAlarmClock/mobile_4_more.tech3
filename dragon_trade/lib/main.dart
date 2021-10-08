import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/home.dart';
import 'package:dragon_trade/screens/login.dart';
import 'package:dragon_trade/utils/fade_widget.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) => {
          setState(() {
            UserData.name = prefs.getString('name');
            UserData.gold = prefs.getInt('gold');
            UserData.page = prefs.getInt('page') ?? 0;
          })
        });
    print(UserData.name.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FadeWidget(
      widget: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserData.name == null ? Login() : Home(),
      ),
    );
  }
}
