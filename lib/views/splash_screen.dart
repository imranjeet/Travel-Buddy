
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_buddy/providers/onboarding_tour_provider.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:travel_buddy/views/onboarding_tour.dart';
import 'package:travel_buddy/views/post_listing_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  OnboardingTourProvider onboardingTourProvider = OnboardingTourProvider();

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  initAsync() async {
    Timer(const Duration(seconds: 2), () async {
      if (await onboardingTourProvider.canLaunch()) {
        startTour();
      } else {
        _didPushButton(PostListingScreen.routeName);
      }
    });
  }

  startTour() async {
    await Future.delayed(Duration.zero); // Introduce a microtask delay
    await Navigator.pushNamed(context, OnboardingTourPage.routeName);
    _didPushButton(PostListingScreen.routeName);
  }

  _didPushButton(String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                AppColors.primaryColor,
                Colors.blue,
              ],
                  stops: [
                0.0,
                1.0
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated)),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/logo.png',
                    //   width: size.width * 0.6,
                    //   height: size.height * 0.18,
                    // ),
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      "Travel Buddy",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Made BY ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Ranjeet Kumar',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
