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
           sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
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
      )),
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
        sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
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
      )),
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
          sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
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
      )),
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
            '  Ох уж эти лепреконы… Всех монет мира им мало. И серебром, и золотом, и медяками набиты их сокровищницы. А уж услуги свои по вложению в монеты заморские предлагают каждому доброму путнику предлагают.\n\n  Берем?',
            style: AppColors.text,
          )),
          SizedBox(
            height: 16,
          ),
          sl.SliderWidget(min: 0,max: UserData.gold??1000,value: 0,),
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
      )),
];
