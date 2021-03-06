import 'package:dragon_trade/models/dragon.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/caves.dart';
import 'package:dragon_trade/screens/chapters/chapter_1.dart';
import 'package:dragon_trade/screens/chapters/chapter_2.dart';
import 'package:dragon_trade/screens/chapters/forests.dart';
import 'package:dragon_trade/screens/chapters/kingdom.dart';
import 'package:dragon_trade/screens/chapters/witchers.dart';
import 'package:dragon_trade/screens/result_screen.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/chapter_card.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
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
      backgroundColor: Color(0xffEBF3FE),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffEBF3FE),
        title: SvgPicture.asset('assets/svg/logo2.svg'),
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
        maxHeight: 900,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0, child: AnimationRive(animation: '4', big: true,))
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
                  go: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => scr.Chapter(
                            chapter: chapterOne0,
                          ))).then((value) => setState(() {
                            
            })),
                  title: '?????? ????????????????',
                  txtColor: Color(0xff54375E),
                  colorBck: Color(0xffF9F1FF),
                  image: 'assets/illustration button.png',
                  done: UserData.dom1,
                  lostMoney: UserData.gold??0,
                  loked: UserData.lockAll,
                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                    go:UserData.lockAll?null: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChapterForest(
                              chapter: chapterForest,
                            ))).then((value) => setState(() {
              
            })),
                    title: '???????????????????? ????????',
                    txtColor: Color(0xff207D83),
                    colorBck: Color(0xffE1F8FF),
                    image: 'assets/illustration button-1.png',
                    done: UserData.dom2,
                    lostMoney: UserData.elves,
                    loked: UserData.lockAll

                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go:UserData.lockAll?null: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterWitches(
                            chapter: chapterWitch,
                          ))).then((value) => setState(() {
              
            })),
                  title: '?????????? ??????????',
                  txtColor: Color(0xffA35D38),
                  colorBck: Color(0xffFFF0F0),
                  image: 'assets/illustration button-2.png',
                  done: UserData.dom3,
                  lostMoney: UserData.witchers,
                  loked: UserData.lockAll,

                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go:UserData.lockAll?null: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterCave(
                            chapter: chapterCaves,
                          ))).then((value) => setState(() {
              
            })),
                  title: '???????????? ????????????',
                  txtColor: Color(0xff292844),
                  colorBck: Color(0xffE5E5E5),
                  image: 'assets/illustration button-3.png',
                  done: UserData.dom4,
                  lostMoney: UserData.gnomes,
                  loked: UserData.lockAll,

                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go:UserData.lockAll?null: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterPeople(
                            chapter: chapterKingdom,
                          ))).then((value) => setState(() {
              
            })),
                  title: '?????????????? ??????????????????????',
                  txtColor: Color(0xff537F5E),
                  colorBck: Color(0xffF2F6D7),
                  image: 'assets/illustration button-4.png',
                  done: UserData.dom5,
                  lostMoney: UserData.people,
                  loked: UserData.lockAll,
                ),
                SizedBox(
                  height: 8,
                ),
                Chapter(
                  go:UserData.lockAll?null: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterLeprecons(
                            chapter: chapterTwo,
                          ))).then((value) => setState(() {
              
            })),
                  title: '?????????? ????????????????????',
                  txtColor: Color(0xffAC121B),
                  colorBck: Color(0xffFFEFEF),
                  image: 'assets/illustration button-5.png',
                  done: UserData.dom6,
                  lostMoney: UserData.leprecons,
                  loked: UserData.lockAll,

                ),
                SizedBox(
                  height: 8,
                ),
              ],
            )),
      ),
    );
  }
}

