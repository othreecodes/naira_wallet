import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/utilities/routes.dart';

@immutable
class LeadInfoText extends StatelessWidget {
  final heading;
  final subText;

  LeadInfoText({this.heading, this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          heading,
          style: text32,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          subText,
          style: text14,
        ),
      ],
    );
  }
}

class HomeButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
      decoration: BoxDecoration(
          color: colorPrimaryDark, borderRadius: BorderRadius.circular(18.0)),
      child: ButtonBar(
        buttonPadding: EdgeInsets.all(0.0),
//                          buttonMinWidth: 100,
        buttonAlignedDropdown: true,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlatButton(
              padding: EdgeInsets.all(14.0),
              color: colorPrimaryDark,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(18.0))),
              child: Text(
                "  Send  ",
                style: TextStyle(fontFamily: "Circular", fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              height: 30,
              width: 2,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlatButton(
              padding: EdgeInsets.all(14.0),
              color: colorPrimaryDark,
              child: Text(
                "Receive",
                style: TextStyle(fontFamily: "Circular", fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              height: 30,
              width: 2,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: FlatButton(
              child: Image.asset(
                "assets/images/qrcode.png",
                color: Colors.white,
                height: 24,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(18.0))),
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              color: colorPrimaryDark,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class WalletListItem extends StatelessWidget {
  final name;
  final code;
  final url;
  final amount;
  final onTap;

  WalletListItem({this.name, this.code, this.url, this.amount,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Image.network(url),
      ),
      title: Text(
        name,
        style: text18black,
      ),
      subtitle: Text(
        code,
        style: TextStyle(
            fontFamily: "Circular",
            color: colorTextDark.withAlpha(80),
            fontSize: 12.0),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "₦ $amount",
            style: text14Money,
          ),
          Text(
            " ",
            style: text14,
          )
        ],
      ),
      onTap: () async {
        //setColor();
        Navigator.of(context).pushNamed(Routes.WALLET_DETAIL_ROUTE);

      },
    );
  }
}
