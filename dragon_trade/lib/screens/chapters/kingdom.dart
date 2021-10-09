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