// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCk-Es1301588DbLBM89hGM3dW-EWZXMhg',
    appId: '1:306599829309:web:73f8e52ce24e9755556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    authDomain: 'piponet-457bf.firebaseapp.com',
    storageBucket: 'piponet-457bf.appspot.com',
    measurementId: 'G-Q2168RWK9S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxYEVL9nJ6JnDbe7H3lPPofw88lWjyoI8',
    appId: '1:670718218610:android:9f55b971fde442109bcdeb',
    messagingSenderId: '670718218610',
    projectId: 'to-do-d3e55',
    storageBucket: 'to-do-d3e55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVamBHNJvLxcVoLBgauVIJQUr6Agvc2w0',
    appId: '1:867401713022:ios:a62dc3119ab8d63a5e5f2f',
    messagingSenderId: '867401713022',
    projectId: 'piponet-a1fcf',
    storageBucket: 'piponet-a1fcf.appspot.com',
    iosBundleId: 'com.nurebharat.piponet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa0adOSxNlWUytfrEgiQ6aL5X8riEaD8g',
    appId: '1:306599829309:ios:be18768fe20684c9556f54',
    messagingSenderId: '306599829309',
    projectId: 'piponet-457bf',
    storageBucket: 'piponet-457bf.appspot.com',
    iosBundleId: 'com.example.piponet.RunnerTests',
  );
}