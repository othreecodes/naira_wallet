import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nairawallet/main.dart';
import 'package:nairawallet/views/create_account_page.dart';
import 'package:nairawallet/views/home_page.dart';
import 'package:nairawallet/views/onboarding_page.dart';
import 'package:nairawallet/views/wallet_detail_page.dart';

class Routes {
  //Routes
  static const String CHECK_USER_ROUTE = "/check-user";
  static const String ONBOARDING_ROUTE = "/onboarding";
  static const String CREATE_ACCOUNT_ROUTE = "/create-account";
  static const String CREATE_ACCOUNT_HOME = "/home";
  static const String WALLET_DETAIL_ROUTE = "/home/wallet-detail";




}

var routes = {
  Routes.CHECK_USER_ROUTE: (context) => Loading(),
  Routes.ONBOARDING_ROUTE: (context) => OnboardingView(),
  Routes.CREATE_ACCOUNT_ROUTE: (context) => CreateAccountView(),
  Routes.CREATE_ACCOUNT_HOME: (context) => HomeView(),
  Routes.WALLET_DETAIL_ROUTE: (context) => WalletDetailPage()
};



