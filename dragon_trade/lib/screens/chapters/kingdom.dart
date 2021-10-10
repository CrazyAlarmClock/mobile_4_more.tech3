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


class ChapterPeople extends StatefulWidget {
  final List<ChapterModel> chapter;
  const ChapterPeople({this.chapter});

  @override
  _ChapterPeopleState createState() => _ChapterPeopleState();
}

class _ChapterPeopleState extends State<ChapterPeople> {
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
    value=UserData.people;
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
          AnimationRive(animation: '9',),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
            '  Людское королевство давно зарекомендовало себя как надежный партнер и развивающий все возможные отрасли игрок. Всё строят и расширяются, и конечно же предлагают в них вложиться.\n\n  Сколько выделить монет на покупку облигаций людского королевства?',
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
              '$value из ${UserData.gold==null?1000.0:UserData.gold<UserData.people?(UserData.people) :(UserData.gold)}',
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
           max:UserData.gold==null?1000.0:UserData.gold<UserData.people?(UserData.people+0.0) :(UserData.gold+0.0),
      )),
        )
    
      ],
   ),
          Gossip(
              name:
                  'Король людей Гронт Веселый объявил о строительстве нового моста на остров дриад.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Камень и древо бесконечным потоком везут в Баритию для расширения города и постройки домов'),
        ],
      ),
                  BottomButton(
          name: 'Вложить монеты',
          handler: (){
            
            UserData.people=value;
            UserData.gold=(UserData.gold??1000)- value;
              UserData.dom5 = true;
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
List<ChapterModel> chapterKingdom = [

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
                      '\n\nОблигации это тоже ценные бумаги, как и акции, но работают они немного по-другому. Их может выпустить компания или государство — ему тоже, бывает, нужны деньги.\n\nПо сути, это займ. Компания берёт у вас деньги в долг и гарантирует их возврат через определённый срок с процентами.\n\nУ облигаций есть цена, номинал и купон.\n\nКупон — это процент по облигациям. Вы будете получать купонный доход в течение срока жизни облигации. Купоны выплачиваются периодически, например раз в квартал или раз в полгода, почти как проценты по банковскому вкладу. Но между купонами и процентами по вкладу есть разница.\n\nПо сути, вам не нужно задумываться о купонах и ценах, просто смотрите на доходность к погашению — именно она показывает, сколько процентов годовых с учётом размера купонов и разницы в ценах вы заработаете, если купите облигацию сейчас и будете держать её до погашения. Почти как депозиты в банке: вы знаете процент и можете посчитать свой доход к окончанию срока вклада.\n\nПодробнее вы можете прочитать на нашем портале '),
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
            text: 'Инвестиции в облигации.'),
      ),
      name: 'Людское королевство',
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
            '  Людское королевство давно зарекомендовало себя как надежный партнер и развивающий все возможные отрасли игрок. Всё строят и расширяются, и конечно же предлагают в них вложиться.\n\n  Сколько выделить монет на покупку облигаций людского королевства?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 16,
          ),
       new sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
          Gossip(
              name:
                  'Король людей Гронт Веселый объявил о строительстве нового моста на остров дриад.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Камень и древо бесконечным потоком везут в Баритию для расширения города и постройки домов'),
        ],
      )),];