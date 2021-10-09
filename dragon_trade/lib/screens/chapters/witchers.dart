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
        BottomButton(
          name: 'Далее',
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
            '  А вот и башни магов на горизонте…Магистры всегда в курсе всех новостей и водят дружбу со всеми расами средиземья.\n\n  В их фондах собраны только лучшие ценные бумаги, стабильные и надежные как сама магия.\n\n  Будем ли вкладывать них, Леонид?',
            style: AppColors.text,
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