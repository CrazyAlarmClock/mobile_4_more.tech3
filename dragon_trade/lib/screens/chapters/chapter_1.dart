import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart' as scr;
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dragon_trade/models/keys.dart';

List<ChapterModel> chapterOne = [
  ChapterModel(
      hint: Text(
        'В этой главе рассказывается о том как важно определиться с целями инвестирования.\n\nС начала 2019 года Центральный Банк Российской Федерации постепенно снижает ключевую ставку. Из-за этого проценты по депозитам упали почти в 2 раза — вместо 6−7 %, как в прошлом году, сейчас банки предлагают 3−4 %. А инфляция растёт — за 9 месяцев 2020 года она составила 3,67 %, а за последние 5 лет — 22,13 %. Это значит, что если бы вы 5 лет назад отложили 1 млн ₽, то сегодня эта сумма была бы эквивалентна 800 000 ₽, так как цены выросли. То есть вы просто так, на пустом месте, потеряли бы 200 000 ₽.',
        style: TextStyle(
            height: 22 / 14,
            color: Color(0xff333333),
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      name: 'Глава I. Цель — всему голова',
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
            '  Посмотрели дракон и Леонид на монеты и поняли что нужно их вложить, да вот только вложить можно по-разному. Что же делать?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 32,
          ),
          InkWell(
            onTap: () => scr.showHint(
              RichText(
                
                text: TextSpan(
                  children: [TextSpan(style: TextStyle(
                        height: 22 / 14,
                        color: Color(0xff333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    text:
                        '\n\nДля него характерны вложения на долгий срок. Такой стиль предполагает, что человек вложил деньги, например, в акции компании, и несколько лет держит их, не продавая. Как правило пассивные инвестиции производятся в крупные сырьевые, технологические, финансовые компании — у них ниже риск резкого падения котировок, часто такие компании платят дивиденды.'),],
                    style: TextStyle(
                        height: 22 / 16,
                        color: Color(0xff333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                    text:
                        'Пассивное инвестирование.'),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/svg/save_money.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () => scr.showHint(
              RichText(
                
                text: TextSpan(
                  children: [TextSpan(style: TextStyle(
                        height: 22 / 14,
                        color: Color(0xff333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    text:
                        '\n\nЗдесь подразумевается, что инвестор вкладывает деньги в более рискованные инструменты. Например, в акции не локомотивов индустрии, а в акции компаний поменьше — при колебаниях рынках такие бумаги сильнее растут или падают (то есть, обладают высокой волатильностью), но за счет этого же качества можно больше заработать. Такой вид инвестиций требует глубокого понимания рынка и готовности потерять вложенные средства.'),],
                    style: TextStyle(
                        height: 22 / 16,
                        color: Color(0xff333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                    text:
                        'Агрессивное инвестирование.'),
              ),
            ),
            child: Container(
               margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/svg/mult_money.svg',
                  fit: BoxFit.fitWidth,
                )),
          )
        ],
      )),
  ChapterModel(
      name: 'Глава I. Цель — всему голова',
      buttons: [
        BottomButton(
          name: 'Далее',
        )
      ],
      hint:  RichText(
                
                text: TextSpan(
                  children: [TextSpan(style: TextStyle(
                        height: 22 / 14,
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    text:
                        'https://school.vtb.ru/lessons/pervye-shagi-na-birzhe/kak-mozhno-zarabotat-na-iis/',
                        recognizer: new TapGestureRecognizer()
                    ..onTap = () { Navigator.push(Application.navKey.currentContext, MaterialPageRoute(builder: (context)=>scr.WebViewExample(url: 'https://school.vtb.ru/lessons/pervye-shagi-na-birzhe/kak-mozhno-zarabotat-na-iis/',)));}),],
                    style: TextStyle(
                        height: 22 / 14,
                        color: Color(0xff333333),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    text:
                        'Частное лицо не может торговать на бирже самостоятельно. Этим занимаются брокеры, и они же выступают в качестве посредников между биржей и инвестором. Нужно открыть брокерский счет  , после чего владельцу счета открывается возможность покупать/продавать ценные бумаги.\n\nТакже брокеры предоставляют услуги профессионального управляющего. Вместе со специалистами вы выбираете стратегию инвестирования, договариваетесь, при каких условиях какие акции покупать/продавать, а дальше ситуативные решения по вашему портфелю принимает управляющий.\n\nПодробнее об услугах, комиссиях брокера и инвестиционных счетах вы можете прочитать на нашем портале '),
              ),
      isBackButton: true,
      text: Column(
        children: [
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Text(
            '  Коль уж определились с целью, стало понятно и что напрямую сделки заключать затратно, а вести дела через казначея надежного, за небольшую монету, куда сподручнее.',
            style: AppColors.text,
          )),
        ],
      )),
  ChapterModel(
      name: 'Глава I. Цель — всему голова',
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
            '  Усталые и довольные, захватив с собой казначея для сделок денежных, наши герои отправились дальнюю дорогу, в места где богатства несметные и горы золотые…',
            style: AppColors.text,
          )),
        ],
      )),
];
