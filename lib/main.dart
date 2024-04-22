import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travel_buddy/firebase_options.dart';
import 'package:travel_buddy/providers/airport_provider.dart';
import 'package:travel_buddy/providers/onboarding_tour_provider.dart';
import 'package:travel_buddy/providers/post_provider.dart';
import 'package:travel_buddy/utils/router.dart';
import 'package:travel_buddy/views/splash_screen.dart';

void main() async {
  await InitializeApp.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingTourProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => AirportProvider()),
      ],
      child: MaterialApp(
        title: 'Travel Buddy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}

class InitializeApp {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Initilizing firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
