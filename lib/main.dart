import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/utilities/cache.dart';
import 'package:nairawallet/utilities/routes.dart';
import 'package:nairawallet/views/onboarding_page.dart';

void main() => runApp(MaterialApp(
      initialRoute: Routes.CHECK_USER_ROUTE,
      routes: routes,
      theme: ThemeData(
        primaryColor:  colorPrimary,
        accentColor: Colors.grey,
        primaryColorDark: colorPrimary
       ),
      debugShowCheckedModeBanner: false,
    ));

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Widget firstPage = Container(
    child: Center(
      child: CircularProgressIndicator(value: null, backgroundColor: colorPrimary,)
    ),
    color: Colors.white,
  );
  Cache cache = Cache();

  @override
  void initState() {
    super.initState();
    cache.hasSeenOnboarding().then((value) => {
      setState(() {
        if (value == true) {
          firstPage = OnboardingView();
        } else {
          firstPage = OnboardingView();
        }
      })
    });
  }

  @override
  Widget build(BuildContext context) {


    return firstPage;
  }
}
