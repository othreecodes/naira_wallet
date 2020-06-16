import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/theme/styles.dart';

class WalletDetailPage extends StatefulWidget {
  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white,animate: true);
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorTextDark),
        backgroundColor: Colors.white,
        title: FlatButton.icon(
            onPressed: null,
            icon: Image.network(
              "https://www.cowrywise.com/images/brand/platform-icons/android.png",
              height: 16,
            ),
            label: Text(
              "Cowrywise",
              style: blackHeader,
            )),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "₦ 94,547.90",
                style: TextStyle(
                    fontFamily: "BR",
                    fontSize: 32,
                    color: colorTextDark,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Wrap(
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     FlatButton(
                       shape: borderRadius8,
                       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 48),
                       onPressed: (){

                       },
                       child: Column(
                         children: <Widget>[
                           Icon(Feather.arrow_up_right,color: colorPrimary,),
                           SizedBox(height: 5,),
                           Text("Send", style: bigButtonText,)
                         ],
                       ),
                     ),
                     Opacity(
                       opacity: 0.3,
                       child: Container(
                         width: 1,
                         height: 40.0,
                         color: colorAccentDark,
                       ),
                     ),
                     FlatButton(
                       shape: borderRadius8,
                       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 48),
                       onPressed: (){

                       },
                       child: Column(
                         children: <Widget>[
                           Icon(Feather.arrow_down_right, color: colorPrimary),
                           SizedBox(height: 5,),
                           Text("Receive", style: bigButtonText,)
                         ],
                       ),
                     )
                   ],
                 ),
               ],
                ),
            )

          ],
        ),
      )
    );
  }
}
