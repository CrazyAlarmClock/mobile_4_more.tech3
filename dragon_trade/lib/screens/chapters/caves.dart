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

List<ChapterModel> chapterCaves = [

 
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
                      '\n\nЭти товары обычно сами по себе на бирже не представлены. Но есть фонды, которые инвестируют в такие активы. Вы можете купить акцию фонда и таким образом инвестировать, например, в золото или нефть.\n\nЗолото — консервативный актив, хотя его стоимость растёт очень медленно. Например, с 1979 по 2019 год, то есть в течение 40 лет, он рос в среднем на 3,5 % в год. Это даже меньше инфляции.\n\nНо у золота есть самостоятельная ценность. Инвесторы воспринимают золото как защитный актив, поэтому в случае каких-либо экономических потрясений его цена часто растёт.\n\nПодробнее вы можете прочитать на нашем портале '),
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
            text: 'Золото, драгметаллы, нефть и другие товары'),
      ),
      name: 'Гномьи пещеры',
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
            '  Гномы трудолюбивый народ и с молоком матери впитывают любовь к руде и полезным ископаемым. А как иначе? Ведь гном с детства с киркой и ремеслом дружен. Их услугами и материалами весь мир пользуется — всегда на это спрос есть.\n\nСколько монет в руду и ископаемые вложим?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 16,
          ),
          sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
          Gossip(
              name:
                  'Гномы делают все неторопливо и основательно и подход к казне у них схожий.'),
          SizedBox(
            height: 8,
          ),
          Gossip(
              name:
                  'Большая делегация гномов недавно вернулась из людских земель, ходят слухи что ездили они к Гронту Веселому и о новой большой стройке разговаривали.'),
        ],
      )),];