import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
import 'package:dragon_trade/screens/chapters/go_home.dart';
import 'package:dragon_trade/screens/home.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:dragon_trade/widget/gossip.dart';
import 'package:dragon_trade/widget/slider.dart' as sl;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ChapterLeprecons extends StatefulWidget {
  final List<ChapterModel> chapter;
  const ChapterLeprecons({this.chapter});

  @override
  _ChapterLepreconsState createState() => _ChapterLepreconsState();
}

class _ChapterLepreconsState extends State<ChapterLeprecons> {
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
                    context, MaterialPageRoute(builder: (context) => Home()
                    
              ));
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
    value=UserData.leprecons;
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
          AnimationRive(animation: '11',),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
            '  Ох уж эти лепреконы… Всех монет мира им мало. И серебром, и золотом, и медяками набиты их сокровищницы. А уж услуги свои по вложению в монеты заморские предлагают каждому доброму путнику предлагают.\n\n  Берем?',
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
          Gossip(
              name:
                  'Последний проезжавший караванщик рассказывал будто гномам своей руды не хватает и скупают они всю медь в округе.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Волнения на границе с оркскими пастбищами потребовали от близлижащих королеств нанять больше отрядов наемников для защиты.'),
        ],
      ),
          
       
                  BottomButton(
          name: 'Вложить монеты',
          handler: (){
            
            UserData.leprecons=value;
            UserData.gold=(UserData.gold??1000)- value;
              UserData.dom6 = true;
          if(UserData.dom2&&UserData.dom3&&UserData.dom4&&UserData.dom5&&UserData.dom6){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>scr.Chapter(chapter: chapterHome,)));
              }
              else
            Navigator.of(context).pop();
          },
        ) ]),
                
        ),
        );
  }
}
List<ChapterModel> chapterTwo = [

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
                      '\n\nМногие думают, что валюта — это 100 % защита денег и доход. Это не так. Курс валюты зависит от экономики страны, её выпустившей, и случиться может что угодно. Но как дополнительный инструмент инвестирования валюта подходит — можно снизить риски инвестирования, разнообразить инвестиционный портфель и в перспективе получить прибыль.\n\nВ валюту можно инвестировать как на долгий срок, так и на короткий.\n\nЕсли вы вкладываете валюту в акции или еврооблигации, то подходящие сроки такие же, как по самим по себе акциям и облигациям. Если валюту вы никуда не вкладываете, то для долгосрочного инвестирования она не подходит — её будет «съедать» инфляция. Обычно её держат как финансовую подушку или «деньги про запас».\n\nПодробнее вы можете прочитать на нашем портале '),
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
            text: 'Инвестиции в валюту.'),
      ),
      name: 'Земли лепреконов',
      buttons: [
        BottomButton(
          name: 'Вложить монеты',
        )
      ],
      isBackButton: true,
      text: Column(
        children: [
          AnimationRive(animation: '11',),

          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Text(
            '  Ох уж эти лепреконы… Всех монет мира им мало. И серебром, и золотом, и медяками набиты их сокровищницы. А уж услуги свои по вложению в монеты заморские предлагают каждому доброму путнику предлагают.\n\n  Берем?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 16,
          ),
        new  sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
          Gossip(
              name:
                  'Последний проезжавший караванщик рассказывал будто гномам своей руды не хватает и скупают они всю медь в округе.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Волнения на границе с оркскими пастбищами потребовали от близлижащих королеств нанять больше отрядов наемников для защиты.'),
        ],
      )),


];
