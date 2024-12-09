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
    apiKey: 'AIzaSyD6ijIW-t81o6-yhGn-dYvk2eDyEkO-Quw',
    appId: '1:533779457223:web:8b06560da57381477d0ae2',
    messagingSenderId: '533779457223',
    projectId: 'habithub-660dc',
    authDomain: 'habithub-660dc.firebaseapp.com',
    storageBucket: 'habithub-660dc.firebasestorage.app',
    measurementId: 'G-7Y3S9V842D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3qMlrFQiDHAMpHtu_P4mw2gm9MkShIiU',
    appId: '1:533779457223:android:220a01bc2882c4ea7d0ae2',
    messagingSenderId: '533779457223',
    projectId: 'habithub-660dc',
    storageBucket: 'habithub-660dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwZ2kRYfRcGxKCY6wzmic-Boj3yN2gXLI',
    appId: '1:533779457223:ios:fec29307a86c24b37d0ae2',
    messagingSenderId: '533779457223',
    projectId: 'habithub-660dc',
    storageBucket: 'habithub-660dc.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwZ2kRYfRcGxKCY6wzmic-Boj3yN2gXLI',
    appId: '1:533779457223:ios:fec29307a86c24b37d0ae2',
    messagingSenderId: '533779457223',
    projectId: 'habithub-660dc',
    storageBucket: 'habithub-660dc.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6ijIW-t81o6-yhGn-dYvk2eDyEkO-Quw',
    appId: '1:533779457223:web:919cf07897ae18f47d0ae2',
    messagingSenderId: '533779457223',
    projectId: 'habithub-660dc',
    authDomain: 'habithub-660dc.firebaseapp.com',
    storageBucket: 'habithub-660dc.firebasestorage.app',
    measurementId: 'G-4PJZR8MHGP',
  );
}