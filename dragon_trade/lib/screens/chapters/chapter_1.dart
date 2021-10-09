import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<ChapterModel> chapterOne = [
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
                 
                '  Посмотрели дракон и Леонид на монеты и поняли что нужно их вложить, да вот только вложить можно по-разному. Что же делать?',
              
            style: AppColors.text,

           )),SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity,
            child: SvgPicture.asset('assets/svg/save_money.svg',fit: BoxFit.fitWidth,)),
            SizedBox(
            height: 8,
          ),
Container(
   width: double.infinity,
  child: SvgPicture.asset('assets/svg/mult_money.svg',fit: BoxFit.fitWidth,))
        ],
      )),
      
];