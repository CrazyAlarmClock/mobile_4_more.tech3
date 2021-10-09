import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/screens/test.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<ChapterModel> chapterZero = [
  ChapterModel(
      name: 'Глава 0. Рождение дракона',
      buttons: [
        BottomButton(
          name: 'Далее',
         
        )
      ],
      isBackButton: false,
      text: Column(
        children: [
          SvgPicture.asset('assets/svg/violet_dragon.svg'),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: RichText(
                  text: TextSpan(
            text:
                '  Однажды, в одной далёкой-далёкой стране родился дракон. И разумеется как и все драконы он с самого детства очень любил золото. Но к сожалению, в наследство от матушки и папеньки ему досталось не так уж и много... ',
                
            style: AppColors.text,

            children: [
              TextSpan(
                  text: 'Всего тысяча золотых монет.',
                  style:AppColors.bold)
            ],
          )))
        ],
      )),
      ChapterModel(
        isBackButton: false,
      name: 'Глава 0. Рождение дракона',
      buttons: [
        BottomButton(
          name: 'Далее',
           
        )
      ],
      text: Column(
        children: [
          AnimationRive(animation: '2',),
          SizedBox(
            height: 48,
          ),
          FadeWidget(
              widget: Text(
                '  И стал дракон думы думать. Как же скопить ему золота? Как распорядться своими богатствами? Но проезжал на его удачу в тех краях странник. И пожалел он молодого дракона — согласился помочь ему.',
            style: AppColors.text,
            
          )),
             SizedBox(
            height: 32,
          ),
          FadeWidget(
              widget: Text(
                'Так началась славная история Леонида и дракона…',
            textAlign: TextAlign.center,
            style:TextStyle(color: Color(0xff333333),fontSize: 20,fontWeight: FontWeight.w900),
            
          ))
        ],
      ))
];
