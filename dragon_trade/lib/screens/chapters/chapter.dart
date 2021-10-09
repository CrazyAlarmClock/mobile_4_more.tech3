
import 'dart:io';

import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/keys.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/home.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Chapter extends StatefulWidget {
  final List<ChapterModel> chapter;
  const Chapter({this.chapter});

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {

  List<Widget> getButtons() {
    List<Widget> buttons = [];
    widget.chapter[UserData.page].buttons.forEach((e) {
      BottomButton button = BottomButton(
        name: e.name,
        handler: () {
          if (UserData.page + 1 == widget.chapter.length) {
            UserData.page = 0;
            widget.chapter[UserData.page].isBackButton
                ? Navigator.pop(context)
                : Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
          } else {
            UserData.page += 1;
            setState(() {
              
            });
          }
        },
      );
      buttons.add(button);
    });
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: widget.chapter[UserData.page].isBackButton
                ? IconButton(
                    onPressed: () { Navigator.pop(context);
                    UserData.page=0;
                    },
                    icon: SvgPicture.asset('assets/svg/ic_back.svg'))
                : null,
            actions: [
              if (widget.chapter[UserData.page].hint != null)
                IconButton(
                    onPressed: () {
                      showHint(widget.chapter[UserData.page].hint,);
                    },
                    icon: SvgPicture.asset('assets/svg/ic_question.svg'))
            ],
            elevation: 0,
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(widget.chapter[UserData.page].name,
                style: AppColors.bold)),
        backgroundColor: Colors.white,
        body:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.chapter[UserData.page].text,
                ...getButtons(),
              ]),
        );
  }


}
    void showHint(Widget text,) {
    showModalBottomSheet<dynamic>(
          barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
        isScrollControlled: true,
        constraints: BoxConstraints(
 
  minHeight: 0.0,
  maxHeight: MediaQuery.of(Application.navKey.currentContext).size.height-100
),
        context: Application.navKey.currentContext,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Container(
              
              color: Colors.transparent,
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0))),
                child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Подсказка',style:TextStyle(color: Color(0xff333333),fontSize: 18,fontWeight: FontWeight.w900)),
                            ],
                          ),
                          IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                          Navigator.pop(bc);
                        }, icon: SvgPicture.asset('assets/svg/ic_close.svg')),
                       
                        ],
                      ),
                      
                      Container(
                        height: MediaQuery.of(bc).size.height/2,
                        child: ListView(
                      
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:16.0,right: 16,bottom: 26),
                              child:text
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
          ]);
        });
  }

class WebViewExample extends StatefulWidget {
  final String url;
  WebViewExample({this.url});
   @override
   WebViewExampleState createState() => WebViewExampleState();
 }

 class WebViewExampleState extends State<WebViewExample> {
   @override
   void initState() {
     super.initState();
         // Enable hybrid composition.

   }
   

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(backgroundColor: Colors.white,
         title: Text(''),leading:IconButton(
                    onPressed: () { Navigator.pop(context);
                    UserData.page=0;
                    },
                    icon: SvgPicture.asset('assets/svg/ic_back.svg'))),
       body: WebView(
         
         initialUrl: widget.url,
       ),
     );
   }
 }


