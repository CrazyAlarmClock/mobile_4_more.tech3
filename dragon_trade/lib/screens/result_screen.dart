import 'dart:io';
import 'dart:typed_data';

import 'package:dragon_trade/models/dragon.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ResultScreen extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();

  createReuslt(data) async {
    final buffer = data.buffer;
    Directory tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/Final.png';
    print(filePath);

    await File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    return filePath.toString();
  }

  String getSum(int money, double proc) {
    if (money == 0) {
      return '0';
    } else {
      return (money + (money / proc * 100)).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(UserData.balance);
    print(UserData.risk);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                //  UserData.page = 0;
              },
              icon: SvgPicture.asset('assets/svg/ic_back.svg')),
          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Результат', style: AppColors.bold)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Screenshot(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                      height: 450,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset('assets/svg/logo3.svg'),
                            ),
                          ),
                          AnimationRive(
                            animation: '4',
                            big: true,
                          ),
                          Positioned(
                              bottom: 60,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text('Доход дракона',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff333333).withOpacity(0.7),
                                    )),
                              )),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                                text: TextSpan(
                              style: TextStyle(fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(
                                  text: getSum(
                                      (UserData.gold +
                                          UserData.elves +
                                          UserData.witchers +
                                          UserData.people +
                                          UserData.gnomes +
                                          UserData.leprecons),
                                      30.3),
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900),
                                ),
                                TextSpan(
                                  text: ' +30,3%',
                                  style: TextStyle(
                                      color: Color(0xff45C051),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                controller: screenshotController),
            BottomButton(
              activeColor: Color(0xff3A83F1),
              textColor: Colors.white,
              handler: () async {
                await screenshotController
                    .capture()
                    .then((Uint8List image) async {
                  print(image.toString());
                  Share.shareFiles([await createReuslt(image)],
                      text: '#vtbinvest #dragoninvest3 #ВТБ');
                });
              },
              name: "Поделиться результатами в соц сетях",
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                height: 56,
                  decoration: BoxDecoration(
                      color: Color(0xffEBF3FE),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Скачать',
                        style: TextStyle(
                            color: Color(0xff14315C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/vtb2.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ВТБ Мои Инвестиции',
                        style: TextStyle(
                            color: Color(0xff14315C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            HideCard(
              text: 'Акции эльфов',
              desc:
                  'Несмотря на слухи, сделка с дриадами все же состоялась, и год выдался урожайным. Как и всегда эльфы сумели обернуть ситуацию себе на пользу, подтвердив тем самым что акции это рисковый спобов инвестиций хотя и с высокой возможной доходностью.',
              plus: '+32%',
              money: getSum(UserData.elves, 32.0),
            ),
            HideCard(
              text: 'Фонды магов',
              desc:
                  'Маги не упускают ничего из виду. Как и в этот раз. Вложив в фонды магов вы не упустили свой шанс, хоть и с низкой доходностью, но и риски были минимальны.',
              plus: '+32%',
              money: getSum(UserData.witchers, 32.0),
            ),
            HideCard(
              text: 'Металлы гномов',
              desc:
                  'Вложиться в металлы гномов всегда правильное решение, особенно на фоне роста строительства в королевсте людей. Низкая доходность, малые риски. Неплохой вариант для долгосрочных инвестиций.',
              plus: '+4,3%',
              money: getSum(UserData.gnomes, 4.3),
            ),
            HideCard(
                text: 'Облигации людей',
                desc:
                    'Люди все строят и развиваются. Растут и занимают новые земли. Как солнце сменяет луну и луна солнце. Низкая доходность, низкие риски и прозрачность вложений — неплохой вариант для долгосрочных инвестиций.',
                plus: '+12%',
                money: getSum(UserData.people, 12.0)),
            HideCard(
                text: 'Валюта лепреконов',
                desc:
                    'Валюта как вода, изменчива и быстра. Хорошая возможная доходность, но и риски довольно высоки. На фоне высокой инфляции в ходе чеканки новых монет для отрядов наемников, в тот год стоимость валюты снизилась довольно сильно.',
                plus: '-50%',
                money: getSum(UserData.leprecons, -50.0)),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class HideCard extends StatefulWidget {
  final String text;
  final String desc;
  final String plus;
  final String money;

  const HideCard({Key key, this.text, this.desc, this.plus, this.money})
      : super(key: key);

  @override
  State<HideCard> createState() => _HideCardState();
}

bool hide = false;

class _HideCardState extends State<HideCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                style: TextStyle(fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.text,
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: widget.money.toString(),
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  TextSpan(
                    text: ' ${widget.plus}',
                    style: TextStyle(
                        color: widget.plus != '-50%'
                            ? Color(0xff45C051)
                            : Color(0xffC04545),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  setState(() {
                    hide = !hide;
                  });
                },
                child: RotatedBox(
                    quarterTurns: !hide ? 2 : 0,
                    child: Container(
                        child: SvgPicture.asset('assets/svg/ic_angle.svg'))),
              )
            ],
          ),
          hide
              ? Container(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffEBF3FE),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Text(
                      widget.desc,
                      style: TextStyle(
                          color: Color(0xff3A83F1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
