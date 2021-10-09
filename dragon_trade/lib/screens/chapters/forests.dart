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