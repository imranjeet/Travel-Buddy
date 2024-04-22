// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCW-UtBvxVC_wK6rZIdiy7c_LtIyCepvhc',
    appId: '1:29572559004:web:af2752f232c8659e87fd59',
    messagingSenderId: '29572559004',
    projectId: 'travel-buddy-cdd30',
    authDomain: 'travel-buddy-cdd30.firebaseapp.com',
    storageBucket: 'travel-buddy-cdd30.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLHvH0OPN9ioNkB-q0GLtZk2HzSOq7RuE',
    appId: '1:29572559004:android:c8424a384cea638e87fd59',
    messagingSenderId: '29572559004',
    projectId: 'travel-buddy-cdd30',
    storageBucket: 'travel-buddy-cdd30.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDt74oNZM8Hw75_B_KHIHPr0Qmp8IbjOQk',
    appId: '1:29572559004:ios:a812842a43887a0d87fd59',
    messagingSenderId: '29572559004',
    projectId: 'travel-buddy-cdd30',
    storageBucket: 'travel-buddy-cdd30.appspot.com',
    iosBundleId: 'com.example.travelBuddy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDt74oNZM8Hw75_B_KHIHPr0Qmp8IbjOQk',
    appId: '1:29572559004:ios:a812842a43887a0d87fd59',
    messagingSenderId: '29572559004',
    projectId: 'travel-buddy-cdd30',
    storageBucket: 'travel-buddy-cdd30.appspot.com',
    iosBundleId: 'com.example.travelBuddy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCW-UtBvxVC_wK6rZIdiy7c_LtIyCepvhc',
    appId: '1:29572559004:web:c5fa9b901e4d00b787fd59',
    messagingSenderId: '29572559004',
    projectId: 'travel-buddy-cdd30',
    authDomain: 'travel-buddy-cdd30.firebaseapp.com',
    storageBucket: 'travel-buddy-cdd30.appspot.com',
  );
}
