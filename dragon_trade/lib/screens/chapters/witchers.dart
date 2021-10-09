import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
import 'package:dragon_trade/screens/chapters/go_home.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:dragon_trade/widget/gossip.dart';
import 'package:dragon_trade/widget/slider.dart' as sl;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dragon_trade/screens/home.dart';

class ChapterWitches extends StatefulWidget {
  final List<ChapterModel> chapter;
  const ChapterWitches({this.chapter});

  @override
  _ChapterWitchesState createState() => _ChapterWitchesState();
}

class _ChapterWitchesState extends State<ChapterWitches> {
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
    value=UserData.witchers;
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
                
                children: [
                Column(
        children: [
         AnimationRive(animation: '10"',),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
            '  А вот и башни магов на горизонте…Магистры всегда в курсе всех новостей и водят дружбу со всеми расами средиземья.\n\n  В их фондах собраны только лучшие ценные бумаги, стабильные и надежные как сама магия.\n\n  Будем ли вкладывать них, Леонид?',
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
   ),
    SizedBox(
            height: 16,
          ),
          Gossip(
              name:
                  'Маги знают цену золоту, держат нос по ветру и всегда вкурсе где и почем купить редкие ингридиенты.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Архимаг Елитодий каждый код отправляет своих учеников в разные  королевства за новостями и редкостями.'),
        ],
                ),
                 SizedBox(
            height: 32,
          ),
                  BottomButton(
          name: 'Вложить монеты',
          handler: (){
            
            UserData.witchers=value;
            UserData.gold=(UserData.gold??1000)- value;
              UserData.dom3 = true;
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
List<ChapterModel> chapterWitch = [
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
                      '\n\nФонд — это возможность инвестировать в акции или облигации крупных российских или иностранных компаний разом. Вы покупаете одну акцию или пай фонда — и уже акционер Microsoft, «Газпрома» или «Яндекса».\n\nФонд работает так: инвесторы вкладывают в него деньги, а управляющая компания фонда покупает на них акции или облигации и потом распределяет доход между всеми инвесторами в зависимости от того, кто сколько денег вложил. То есть чем больше акций или паёв фонда вы купите, тем выше будет ваш доход.\n\nФонды делят по нескольким видам.'),
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                  text: '\n\nКуда они инвестируют.'),
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  text:
                      ' Фонды могут инвестировать в разные активы, например, в российские или американские акции, облигации, золото, валюты. Вы можете выбрать фонд, который работает только в нефтегазовой отрасли, к примеру, или вкладывает в драгметаллы.'),
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                  text: '\n\nВ какой стране зарегистрированы.'),
              TextSpan(
                  style: TextStyle(
                      height: 22 / 14,
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  text:
                      ' Если в России — это ПИФ, паевый инвестиционный фонд, или БПИФ — биржевой инвестиционный фонд. Пай БПИФ можно купить и продать на бирже, пай ПИФ — напрямую через управляющую компанию.\n\nЕсли фонд зарегистрирован в другом государстве — это ETF, иностранный биржевой инвестиционный фонд. Его акции или паи можно купить и продать на бирже.\n\nПодробнее вы можете прочитать на нашем портале '),
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
            text: 'Инвестиции в фонды.'),
      ),
      name: 'Башни магов',
      buttons: [
        
      ],
      isBackButton: true,
      text: Column(
        children: [
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
            '  А вот и башни магов на горизонте…Магистры всегда в курсе всех новостей и водят дружбу со всеми расами средиземья.\n\n  В их фондах собраны только лучшие ценные бумаги, стабильные и надежные как сама магия.\n\n  Будем ли вкладывать них, Леонид?',
            style: AppColors.text,
          ),
              )),
          SizedBox(
            height: 16,
          ),
        new  sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
          Gossip(
              name:
                  'Маги знают цену золоту, держат нос по ветру и всегда вкурсе где и почем купить редкие ингридиенты.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Архимаг Елитодий каждый код отправляет своих учеников в разные  королевства за новостями и редкостями.'),
        ],
      )),];