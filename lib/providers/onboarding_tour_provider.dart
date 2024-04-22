import 'package:travel_buddy/services/shared_preference_keys.dart';
import 'package:travel_buddy/services/shared_preference_manager_telemed.dart';
import 'package:flutter/material.dart';

class OnboardingTourProvider extends ChangeNotifier {
  bool _isOnboardingOpen = false;

  bool get isOnboardingOpen => _isOnboardingOpen;

  set isOnboardingOpen(bool value) {
    _isOnboardingOpen = value;
    notifyListeners();
  }

  Future<bool> canLaunch() async {
    bool? firstLaunch = await SharedPreferenceManager()
        .getBoolValueOrNull(SharedPreferenceKeys.firstLaunch);
    return !(firstLaunch == false); // can be null too
  }

  void tourComplete() {
    SharedPreferenceManager()
        .setBoolValue(SharedPreferenceKeys.firstLaunch, false);
  }
}
