import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final int min;
  final int max;
  final int value;
  SliderWidget({
    Key key,
    @required this.min,
    @required this.max,
    @required this.value,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int value;
  int max;
@override
void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void activate() {
    // TODO: implement activate
    super.activate();
  }

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value=widget.value;
    max=UserData.gold??1000;
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '$value из $max',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color(0xff316FCC),
              ),
            ),
        ),
        Container(
          width: double.infinity,
          child: SliderTheme(
            
      data: SliderThemeData(
          disabledActiveTrackColor: Color(0xffB0CDF9),
          disabledInactiveTrackColor: Color(0xffB0CDF9),
          activeTrackColor: Color(0xffB0CDF9),
      inactiveTrackColor:Color(0xffB0CDF9),
      thumbColor: Color(0xff3A83F1),
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
         
      ),
      child: Slider(
          value: value+0.0,
          onChanged: (dynamic v) {
              setState(() {
                value = v.toInt();
                UserData.gold=max-value;
              });
            },
          min: widget.min+0.0,
          max: widget.max+0.0,
      )),
        )
    
      ],
   );
  }
}
