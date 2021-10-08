import 'package:dragon_trade/models/chapter.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/home.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/material.dart';

class Chapter extends StatefulWidget {
  final List<ChapterModel> chapter;
  const Chapter({this.chapter});

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  List<Widget> getButtons(){
List<Widget> buttons=[];
widget.chapter[UserData.page].buttons.forEach((e) {
  BottomButton button=BottomButton(name: e.name,handler: (){
    if(UserData.page+1==widget.chapter.length){
      UserData.page=0;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    }
    else{
      UserData.page+=1;
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
          elevation: 0,
          shadowColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(widget.chapter[UserData.page].name, style: AppColors.bold)),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [widget.chapter[UserData.page].text,...getButtons(),]
          ),
        ));
  }
}
