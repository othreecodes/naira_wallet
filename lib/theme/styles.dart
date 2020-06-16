import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nairawallet/utilities/simplefunctions.dart';

const bold = TextStyle(fontFamily: "Circular", fontWeight: FontWeight.w500);

const text24 = TextStyle(
    fontFamily: 'Circular',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: colorTextDark);

const text32 = TextStyle(
    fontFamily: 'Circular',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: colorTextDark);
const text32Light = TextStyle(
    fontFamily: 'Circular',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white);

const text14 = TextStyle(
    fontFamily: 'Circular',
    fontSize: 14,
    color: colorTextDark,
    fontWeight: FontWeight.w100);
const text14Money = TextStyle(
    fontFamily: 'BR',
    fontSize: 14,
    color: colorTextDark,
    fontWeight: FontWeight.w500);
var text12 = TextStyle(
    fontFamily: 'Circular',
    fontSize: 13,
    color: colorTextDark,
    fontWeight: FontWeight.w100);

const text18 =
    TextStyle(fontFamily: 'Circular', fontSize: 14, color: Colors.white);

const text18black =
TextStyle(fontFamily: 'Circular', fontSize: 16, color:colorTextDark);

const  blackHeader =
TextStyle(fontFamily: 'Circular', fontSize: 20, color:colorTextDark);

const  bigButtonText =
TextStyle(fontFamily: 'Circular', fontSize: 20, color:colorPrimary);

const text18Alpha5 = TextStyle(
fontFamily: 'Circular',
fontSize: 18,
color: Colors.white,
fontWeight: FontWeight.w700,);

const text12Alpha5 = TextStyle(
    fontFamily: 'Circular',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w100,);

const text18Dark =
    TextStyle(fontFamily: 'Circular', fontSize: 14, color: colorPrimary);

var borderRadius8 =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

const topBorderRadius18 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18.0),
        topRight: Radius.circular(18.0)));

const colorPrimary = Colors.green;
var colorPrimaryDark = colorPrimary[700];
const colorAccent = Colors.grey;
const colorError = Colors.red;
const colorTextDark = Color.fromRGBO(39, 47, 56, 1);
var colorAccentDark = Colors.blueGrey[700];
