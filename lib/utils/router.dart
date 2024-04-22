import 'package:flutter/material.dart';
import 'package:travel_buddy/views/create_post_screen.dart';
import 'package:travel_buddy/views/onboarding_tour.dart';
import 'package:travel_buddy/views/post_listing_screen.dart';
import 'package:travel_buddy/views/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // final args = routeSettings.arguments ?? <String, dynamic>{};
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SplashScreen());
    case PostListingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const PostListingScreen());
    case CreatePostScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => CreatePostScreen());
    case OnboardingTourPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const OnboardingTourPage());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
              body: Center(child: Text("Screens does not exist!"))));
  }
}
