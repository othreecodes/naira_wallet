import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/widgets/partials.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light.copyWith( statusBarColor: colorPrimary,),
          child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Opacity(
              child: Text(
                "@othreecodes",
                style: text12Alpha5,
              ),
              opacity: 0.5,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "₦ 94,547.90",
              style: TextStyle(
                  fontFamily: "BR",
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              direction: Axis.vertical,
              children: <Widget>[
                HomeButtonBar(),
              ],
            )),
                SizedBox(
                  height: 20,
                ),
            Expanded(
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Material(
                      elevation: 50.0,
                      color: Colors.white,
                      shape: topBorderRadius18,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            topRight: Radius.circular(18.0)),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: ListView(
                                children: <Widget>[
                                  WalletListItem(
                                    name: "Cowrywise",
                                    code: "CW",
                                    url:
                                        "https://www.cowrywise.com/images/brand/platform-icons/android.png",
                                    amount: "39,110.00",
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  WalletListItem(
                                    name: "Eyowo",
                                    code: "EY",
                                    url:
                                        "https://www.eyowo.com/uploads/favicons/apple-touch-icon.png",
                                    amount: "12,032.11",
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  WalletListItem(
                                    name: "WalletsAfrica",
                                    code: "WA",
                                    url:
                                        "https://s3.us-west-1.amazonaws.com/wallets-docs/logomark_wallet.png",
                                    amount: "18,500.12",
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),

                                  WalletListItem(
                                    name: "Piggyvest",
                                    code: "PV",
                                    url:
                                    "https://dashboard.piggyvest.com/favicon-96x96.png",
                                    amount: "12,405.11",
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  WalletListItem(
                                    name: "Carbon",
                                    code: "CB",
                                    url:
                                    "https://miro.medium.com/max/3150/1*Ml-YePa9lT_nbMQpaGqUlQ.png",
                                    amount: "12,500.56",
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),

                                ],
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              flex: 1,
            )
          ])),
    );
  }
}
//Navigator.of(context,rootNavigator: true).pushNamed(Routes.WALLET_DETAIL_ROUTE);
