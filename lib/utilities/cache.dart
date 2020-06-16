import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static const ONBOARDING_KEY = 'has_seen_onboarding';


  Future<bool> hasSeenOnboarding() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    print("object here");

    prefs.getBool(ONBOARDING_KEY) ?? false;
  }
}
