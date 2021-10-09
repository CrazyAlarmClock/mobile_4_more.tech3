import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/screens/result_screen.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/utils/fade_widget.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:flutter_svg/svg.dart';

List<ChapterModel> chapterHome = [
  ChapterModel(
    
      name: 'Путь домой',
      buttons: [
        BottomButton(
          name: 'Рассчитать',
         handler: (){
           Navigator.pushReplacement(Application.navKey.currentContext, MaterialPageRoute(builder: (c)=>ResultScreen()));
         },
        ),
        
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
                  '  Вот и последнее королевство за спиной…Долгий путь прошли Леонид и дракон. Много стран посетили и народов повидали.\n\nПуть домой их лежит. Казначей уж давно приготовил вложений расчет.',
                  
            style: AppColors.text,

            ),
              ))
        ],
      )),
     
];
