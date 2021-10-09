import 'dart:io';
import 'dart:typed_data';

import 'package:dragon_trade/models/dragon.dart';
import 'package:dragon_trade/models/user.dart';
import 'package:dragon_trade/theme/theme_settings.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(
                        0.5, 2.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0xffE9E7E2),
                      Color(0xffEFEFEF)
                    ], // red to yellow
                    // repeats the gradient over the canvas
                  )),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset('assets/svg/logo.svg'),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                  'assets/svg/violet_dragon.svg'),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 100,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Заработок дракона',
                                    style:TextStyle(color: Color(0xff333333), fontSize: 21, fontWeight: FontWeight.w900),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Text(
                                        UserData.gold ?? '1500',
                                        style:TextStyle(color: Color(0xff333333), fontSize: 49, fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        ' +150%',
                                        style:TextStyle(color: Color(0xff45C051), fontSize: 36, fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                controller: screenshotController),
            RaisedButton(
              onPressed: () async {
                await screenshotController
                    .capture()
                    .then((Uint8List image) async {
                  print(image.toString());
                  Share.shareFiles([await createReuslt(image)],
                      text: '#vtbinvest #dragoninvest3 #ВТБ');
                });
              },
              child: Text("Share Options"),
            )
          ],
        ),
      ),
    );
  }
}
