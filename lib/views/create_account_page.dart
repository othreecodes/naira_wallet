import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nairawallet/blocs/create_account_bloc.dart';
import 'package:nairawallet/main.dart';
import 'package:nairawallet/services/api/api_response.dart';
import 'package:nairawallet/theme/styles.dart';
import 'package:nairawallet/utilities/bloc_provider.dart';
import 'package:nairawallet/utilities/constants.dart';
import 'package:nairawallet/utilities/routes.dart';
import 'package:nairawallet/widgets/dialogs.dart';
import 'package:nairawallet/widgets/loaders.dart';
import 'package:nairawallet/widgets/partials.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class WidgetRoutes {
  static const screen1 = "create-account/username";
  static const screen2 = "create-account/password";
}

class _CreateAccountViewState extends State<CreateAccountView> {
  CreateAccountBloc _bloc;

  final navKey = GlobalKey<NavigatorState>();

  Future<bool> onBackPress() async {
    if (Navigator.of(context).userGestureInProgress) {
      return false;
    }
    if (!navKey.currentState.canPop()) {
      return true;
    }
    navKey.currentState.pop();
    return false;
  }

  @override
  void initState() {
    super.initState();
    _bloc = CreateAccountBloc();
  }

  /**
   *
   * MaterialApp(
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      backgroundColor: Colors.white,
      primaryColor: colorPrimary,
      accentColor: Colors.grey,
      /// Change animation to iOS like slide right animation
      pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      ),
      initialRoute: "${Routes.CREATE_ACCOUNT_ROUTE}/username",
      routes: {
      "${Routes.CREATE_ACCOUNT_ROUTE}/username": (context) => SetUsernameView(_bloc),
      "${Routes.CREATE_ACCOUNT_ROUTE}/password": (context) => SetPinView(_bloc)
      },
      ),
   */

  @override
  Widget build(BuildContext context) {
//    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: colorTextDark),
          ),
          body: BlocProvider(
              bloc: _bloc,
              child: Navigator(
                initialRoute: WidgetRoutes.screen1,
                key: navKey,
                onGenerateRoute: (RouteSettings settings) {
                  print(settings.name);
                  switch (settings.name) {
                    case WidgetRoutes.screen1:
                      return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SetUsernameView();
                          },
                          settings: settings);
                      break;
                    case WidgetRoutes.screen2:
                      return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SetPinView();
                          },
                          settings: settings);
                      break;
                    default:
                      return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SetUsernameView();
                          },
                          settings: settings);
                  }
                },
              ))),
    );
  }
}

class SetPinView extends StatefulWidget {
  @override
  _SetPinViewState createState() => _SetPinViewState();
}

class _SetPinViewState extends State<SetPinView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LeadInfoText(
                  heading: "Protect your wallet",
                  subText:
                      "Add an extra layer of security to keep your wallet safe."),
              SizedBox(
                height: 48.0,
              ),
              PinCodeTextField(
                textInputType: TextInputType.number,
                length: 4,
                textStyle: TextStyle(
                  fontFamily: "Circular"
                ),
                fieldWidth: 50.0,
                obsecureText: false,
                activeColor: colorPrimary,
                inactiveColor: Colors.grey,
                animationType: AnimationType.slide,
                shape: PinCodeFieldShape.underline,
                animationDuration: Duration(milliseconds: 100),
                onChanged: (value) {},
              ),
              Expanded(child: SizedBox(height: 32.0)),
              SafeArea(
                child: FlatButton(
                  padding: EdgeInsets.all(14.0),
                  shape: borderRadius8,
                  color: colorPrimary,
                  child: Text(
                    "All set",
                    style: text18,
                  ),
                  onPressed: () => {
                    Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil(Routes.CREATE_ACCOUNT_HOME, (r)=>false)
                 // Navigator.pushNamed(context, Routes.CREATE_ACCOUNT_HOME)
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              )
            ]));
  }
}

class UsernameTextField extends StatelessWidget {
  var validateFunction;
  var errorText;
  var suffixIcon;

  UsernameTextField({this.validateFunction, this.errorText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        validateFunction(text);
      },
      style: TextStyle(
        fontFamily: "Circular",
        fontSize: 18,
      ),
      decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          labelText: 'username',
          suffixIcon: suffixIcon),
    );
  }
}

class SetUsernameView extends StatefulWidget {
  @override
  _SetUsernameViewState createState() => _SetUsernameViewState();
}

class _SetUsernameViewState extends State<SetUsernameView> {
  CreateAccountBloc _bloc;

  GlobalKey<NavigatorState> _navigatorKey;
  final usernameController = TextEditingController();

  VoidCallback goToPinPage(context) {
    Navigator.of(context).pushNamed(WidgetRoutes.screen2);
  }

  validateText(text) {
    print(text);
    _bloc.validateName(text);
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CreateAccountBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          LeadInfoText(
              heading: "Pick a username",
              subText:
                  "This is how other ${Constants.appName} users can find you and send you payments"),
          SizedBox(
            height: 48.0,
          ),
          StreamBuilder<ApiResponse<String>>(
            stream: _bloc.isNameValid.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    print('object');
                    return UsernameTextField(
                        validateFunction: validateText,
                        errorText: null,
                        suffixIcon: TextFieldProgress(
                            showProgress: true, error: false));
                    break;
                  case Status.COMPLETED:
                    return UsernameTextField(
                        validateFunction: validateText,
                        errorText: null,
                        suffixIcon: TextFieldProgress(
                            showProgress: false, error: false));
                    break;
                  case Status.ERROR:
                    return UsernameTextField(
                        validateFunction: validateText,
                        errorText: snapshot.data.message,
                        suffixIcon: TextFieldProgress(
                          showProgress: false,
                          error: true,
                        ));
                    break;
                }
              }
              return UsernameTextField(
                  validateFunction: validateText,
                  errorText: null,
                  suffixIcon: null);
            },
          ),
          Expanded(child: SizedBox(height: 32.0)),
          SafeArea(
            child: FlatButton(
              padding: EdgeInsets.all(14.0),
              shape: borderRadius8,
              color: colorPrimary,
              child: Text(
                "Continue",
                style: text18,
              ),
              onPressed: () => goToPinPage(context),
            ),
          ),
          SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
