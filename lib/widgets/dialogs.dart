

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nairawallet/theme/styles.dart';


var loadingContent = Container(
  child: Center(

      child: CircularProgressIndicator(value: null, backgroundColor: colorPrimary,)
  ),
  color: Colors.white,
);