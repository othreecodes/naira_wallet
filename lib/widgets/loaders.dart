import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nairawallet/theme/styles.dart';

class TextFieldProgress extends StatelessWidget {
  bool showProgress = false;

  bool error = false;

  TextFieldProgress({this.showProgress, this.error});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.0,
      width: 4.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 18.0, 14.0, 10.0),
        child: showProgress
            ? CircularProgressIndicator(
                backgroundColor: colorPrimary, strokeWidth: 3.0)
            : error
                ? Icon(
                    Icons.error,
                    color: colorError,
                  )
                : Icon(
                    Icons.check_circle,
                    color: colorPrimary,
                  ),
      ),
    );
  }
}
