import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:dragon_trade/widget/gossip.dart';
import 'package:dragon_trade/widget/slider.dart' as sl;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
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
