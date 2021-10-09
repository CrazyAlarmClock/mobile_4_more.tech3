import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Gossip extends StatelessWidget {
  final String name;

  Gossip({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
   
        width: double.infinity,
        padding: EdgeInsets.all(
          12,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xffEBF3FE)),
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/ic_info.svg'),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              name,
              maxLines: 20,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 16 / 12,
              ),
            )),
          ],
        ));
  }
}
