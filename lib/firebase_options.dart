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
    apiKey: 'AIzaSyCwcjlbS9d2H76m3mswPrwLAHbRB7lmRMA',
    appId: '1:783417041325:web:fe744c33fc951bcd7a8124',
    messagingSenderId: '783417041325',
    projectId: 'fir-tuitorial-46fe2',
    authDomain: 'fir-tuitorial-46fe2.firebaseapp.com',
    storageBucket: 'fir-tuitorial-46fe2.appspot.com',
    measurementId: 'G-CHBRER0MN0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhOTLfDakHxtoB2FJB-NyAOwBiz3Q8Flw',
    appId: '1:783417041325:android:3781278bf7a53a397a8124',
    messagingSenderId: '783417041325',
    projectId: 'fir-tuitorial-46fe2',
    storageBucket: 'fir-tuitorial-46fe2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTS5oBJspCnaYbnDChxfKW590B9-Kb2cU',
    appId: '1:783417041325:ios:372767419384a1127a8124',
    messagingSenderId: '783417041325',
    projectId: 'fir-tuitorial-46fe2',
    storageBucket: 'fir-tuitorial-46fe2.appspot.com',
    iosBundleId: 'com.example.firebasetuitorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTS5oBJspCnaYbnDChxfKW590B9-Kb2cU',
    appId: '1:783417041325:ios:372767419384a1127a8124',
    messagingSenderId: '783417041325',
    projectId: 'fir-tuitorial-46fe2',
    storageBucket: 'fir-tuitorial-46fe2.appspot.com',
    iosBundleId: 'com.example.firebasetuitorial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwcjlbS9d2H76m3mswPrwLAHbRB7lmRMA',
    appId: '1:783417041325:web:492fe420998085d77a8124',
    messagingSenderId: '783417041325',
    projectId: 'fir-tuitorial-46fe2',
    authDomain: 'fir-tuitorial-46fe2.firebaseapp.com',
    storageBucket: 'fir-tuitorial-46fe2.appspot.com',
    measurementId: 'G-QEHB9VJF3E',
  );
}
