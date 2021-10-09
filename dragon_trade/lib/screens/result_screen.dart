import 'dart:io';
import 'dart:typed_data';

import 'package:dragon_trade/models/dragon.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/screens/chapters/chapter.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
import 'package:dragon_trade/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ResultScreen extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();

  createReuslt(data) async {
    final buffer = data.buffer;
    Directory tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/Final.png';
    print(filePath);
    await File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    return filePath.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              //  UserData.page = 0;
              },
              icon: SvgPicture.asset('assets/svg/ic_back.svg')),

          elevation: 0,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Результат', style: AppColors.bold)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomRight, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Colors.white,
                      Colors.grey[200],
                    ], // red to yellow
                    // repeats the gradient over the canvas
                  )),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/svg/logo.svg'),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/svg/ch_1.svg',
                            width: 350,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(
                                  text: UserData.gold.toString() ?? '1500',
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 49,
                                      fontWeight: FontWeight.w900),
                                ),
                                TextSpan(
                                  text: ' +150%',
                                  style: TextStyle(
                                      color: Color(0xff45C051),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                controller: screenshotController),
            BottomButton(
              handler: () async {
                await screenshotController
                    .capture()
                    .then((Uint8List image) async {
                  print(image.toString());
                  Share.shareFiles([await createReuslt(image)],
                      text: '#vtbinvest #dragoninvest3 #ВТБ');
                });
              },
              name: "Share result",
            )
          ],
        ),
      ),
    );
  }
}
