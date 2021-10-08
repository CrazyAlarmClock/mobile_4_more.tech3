import 'package:dragon_trade/models/dragon.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/chapter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffF3F3F3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Container(
                  child: SvgPicture.asset('assets/svg/ic_user.svg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  UserData.name ?? 'null',
                  style: AppColors.text,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  UserData.name ?? 'null',
                  style: AppColors.text,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset('assets/svg/ic_faq.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Colors.white,
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        minHeight: 300,
        maxHeight: 600,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                DragonData.name ?? 'null',
                style: AppColors.bold,
              )
            ],
          ),
        ),
        panel: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go: () => null,
                  title: 'Глава I. Цель — всему голова',
                  colorBck: Color(0xffD9FEDA),
                  image: 'assets/svg/ch_1.svg',
                  locked: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go: () => null,
                  title: 'Глава I. Цель — всему голова',
                  colorBck: Color(0xffD9FEDA),
                  image: 'assets/svg/ch_1.svg',
                  locked: false,
                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go: () => null,
                  title: 'Глава I. Цель — всему голова',
                  colorBck: Color(0xffD9FEDA),
                  image: 'assets/svg/ch_1.svg',
                  locked: false,
                ),
              ],
            )),
      ),
    );
  }
}
