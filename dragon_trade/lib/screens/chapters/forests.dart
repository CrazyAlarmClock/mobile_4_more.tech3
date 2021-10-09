import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
import 'package:dragon_trade/screens/chapters/go_home.dart';
import 'package:dragon_trade/screens/home.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:dragon_trade/widget/gossip.dart';
import 'package:dragon_trade/widget/slider.dart' as sl;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChapterForest extends StatefulWidget {
  final List<ChapterModel> chapter;
  const ChapterForest({this.chapter});

  @override
  _ChapterForestState createState() => _ChapterForestState();
}

class _ChapterForestState extends State<ChapterForest> {
int value=0;
  List<Widget> getButtons() {
    List<Widget> buttons = [];
    widget.chapter[UserData.page].buttons.forEach((e) {
      BottomButton button = BottomButton(
        name: e.name,
        handler: () {
          if (UserData.page + 1 == widget.chapter.length) {
            UserData.page = 0;
            widget.chapter[UserData.page].isBackButton
                ? Navigator.pop(context)
                : Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
          } else {
            UserData.page += 1;
            setState(() {
              
            });
          }
        },
      );
      buttons.add(button);
    });
    return buttons;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value=UserData.elves;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: widget.chapter[UserData.page].isBackButton
                ? IconButton(
                    onPressed: () { Navigator.pop(context);
                    UserData.page=0;
                    },
                    icon: SvgPicture.asset('assets/svg/ic_back.svg'))
                : null,
            actions: [
              if (widget.chapter[UserData.page].hint != null)
                IconButton(
                    onPressed: () {
                      scr.showHint(widget.chapter[UserData.page].hint,);
                    },
                    icon: SvgPicture.asset('assets/svg/ic_question.svg'))
            ],
            elevation: 0,
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(widget.chapter[UserData.page].name,
                style: AppColors.bold)),
        backgroundColor: Colors.white,
        body:  SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Column(
        children: [
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Padding(
                padding:  EdgeInsets.all(16.0),
                child: Text(
            '  Вот и эльфийские земли. А акции эльфов в Меллорн издавна пользуются популярностью у всех рас.\n\n  Сколько выделить монет на покупку акций ЗАО “Меллорн”?',
            style: AppColors.text,
          ),
              )),
          SizedBox(
            height: 16,
          ),
           Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '$value из ${UserData.gold??1000}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color(0xff316FCC),
              ),
            ),
        ),
        Container(
          width: double.infinity,
          child: SliderTheme(
            
      data: SliderThemeData(
          disabledActiveTrackColor: Color(0xffB0CDF9),
          disabledInactiveTrackColor: Color(0xffB0CDF9),
          activeTrackColor: Color(0xffB0CDF9),
      inactiveTrackColor:Color(0xffB0CDF9),
      thumbColor: Color(0xff3A83F1),
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
         
      ),
      child: Slider(
          value: value+0.0,
          onChanged: (dynamic v) {
              setState(() {
                value = v.toInt();
               
              });
            },
          min:0+0.0,
          max: (UserData.gold??1000)+0.0,
      )),
        )
    
      ],
   ),SizedBox(
            height: 36,
          ),
          Gossip(
              name:
                  'Ходят слухи что в этом году эльфийские леса постигла засуха.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Договоренность эльфов с дриадами о помощи меллорнам под вопросом. Сделка на грани срыва.'),
        ],
      ),
      SizedBox(
            height: 16,
          ),
                  BottomButton(
          name: 'Вложить монеты',
          handler: (){
            
            UserData.elves=value;
            UserData.gold=(UserData.gold??1000)- value;
            UserData.dom2 = true;
           if(UserData.dom2&&UserData.dom3&&UserData.dom4&&UserData.dom5&&UserData.dom6){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>scr.Chapter(chapter: chapterHome,)));
              }
              else
            Navigator.of(context).pop();
          },
        )
                ]),
        ),
        );
  }
}
List<ChapterModel> chapterForest = [
  ChapterModel(
      hint: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  text:
                      '\n\nКаждый слышал про акции. Но не все понимают, как это работает на практике. На самом деле ничего сложного.\n\nКомпания может стать публичной — выпустить свои акции и продать их на бирже инвесторам. Деньги она получит от продажи акций. А за то, что инвесторы покупают её акции, компания обещает платить им процент от своей прибыли. Это называется дивидендами.\n\nЦена акции зависит от совокупности многих факторов, и повысится она или упадёт — можно только предполагать. На самом базовом уровне на стоимость бумаг влияют спрос и предложение — если тех, кто хочет купить акции, больше, чем тех, кто хочет продать, — цена растёт. Если желающих продать больше, чем тех, кто хочет купить, — падает.\n\nНа цену влияют стоимость компании и её прибыль, состояние экономики в целом и конкретно в отрасли, в которой работает компания. Ещё один важный фактор — финансовая отчётность. Её компании обязаны публиковать раз в квартал. По финансовым отчётам можно понять, работает компания в прибыль или убыток, какая у неё выручка и прибыль, и спрогнозировать дальнейший рост или спад бизнеса. Поэтому стоимость акций может как взлететь, так и упасть после публикации отчётов.\n\nНа цену акций может повлиять и новый конкурент. Например, акции Tesla упали в цене, как только Apple заявила, что начинает разрабатывать свой электромобиль. И даже обычный твит может повлиять на их стоимость. Когда Маск написал в своем Твиттере, что акции Tesla слишком переоценены, они тут же упали в цене на 10 %.\n\nПодробнее вы можете прочитать на нашем портале '),
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  text:
                      'https://school.vtb.ru/lessons/pervye-shagi-na-birzhe/kuda-investirovat/',
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          Application.navKey.currentContext,
                          MaterialPageRoute(
                              builder: (context) => scr.WebViewExample(
                                    url:
                                        'https://school.vtb.ru/lessons/pervye-shagi-na-birzhe/kuda-investirovat/',
                                  )));
                    }),
            ],
            style: TextStyle(
                height: 22 / 14,
                color: Color(0xff333333),
                fontSize: 14,
                fontWeight: FontWeight.w900),
            text: 'Инвестиции в акции.'),
      ),
      name: 'Эльфийские леса',
      buttons: [
        BottomButton(
          name: 'Вложить монеты',
        )
      ],
      isBackButton: true,
      text: Column(
        children: [
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Text(
            '  Вот и эльфийские земли. А акции эльфов в Меллорн издавна пользуются популярностью у всех рас.\n\n  Сколько выделить монет на покупку акций ЗАО “Меллорн”?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 16,
          ),
          new sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
          Gossip(
              name:
                  'Ходят слухи что в этом году эльфийские леса постигла засуха.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Договоренность эльфов с дриадами о помощи меллорнам под вопросом. Сделка на грани срыва.'),
        ],
      ))];