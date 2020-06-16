import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/utilities/routes.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller;
  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  void initState() {
    super.initState();

    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
//    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
//    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith( statusBarColor: Colors.white,),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: PageView(
                    children: <Widget>[
                      OnboardingItem(
                          imagePath: "assets/images/onboarding_money.png",
                          leadText: "Take control of your finances",
                          subText:
                              "See all your wallet balances in one place. Know your total net worth across all your digital wallets."),
                      OnboardingItem(
                          imagePath: "assets/images/onboarding_transactions.png",
                          leadText: "Keep track of your transactions",
                          subText:
                              "With all your money in once place, you know exactly how much you are spending at every point in time."),
                      OnboardingItem(
                          imagePath: "assets/images/onboarding_send.png",
                          leadText: "Send and receive money instantly",
                          subText:
                              "Send and receive money from anyone instanly. You can view the account numbers of your wallets with the click of a button."),
                      OnboardingItem(
                          imagePath: "assets/images/onboarding_backup.png",
                          leadText: "Unlimited backups",
                          subText:
                              "Never loose your data, you can make unlimited back ups that you can access at any time."),
                    ],
                    controller: controller,
                  ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: WormEffect(
                      dotHeight: 8.0,
                      radius: 8.0,
                      dotWidth: 8.0,
                      activeDotColor: colorPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(14.0),
                  shape: borderRadius8,
                  color: colorPrimary,
                  child: Text(
                    "Create a new account",
                    style: text18,
                  ),
                  onPressed: () {

                    Navigator.pushNamed(context, Routes.CREATE_ACCOUNT_ROUTE);
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(14.0),
                  color: Colors.white,
                  child: Text(
                    "I already have an account",
                    style: text18Dark,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class OnboardingItem extends StatelessWidget {
  String imagePath;
  String leadText;
  String subText;

  OnboardingItem({this.imagePath, this.leadText, this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(imagePath),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            leadText,
            style: text24,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subText,
            style: text14,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
