// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyD7ncSxt2yjgpQSN7Y6HTe6anpPDNL9evc',
    appId: '1:272633119424:web:0050ee50b6ea4b2796a325',
    messagingSenderId: '272633119424',
    projectId: 'lauquang-doan',
    authDomain: 'lauquang-doan.firebaseapp.com',
    storageBucket: 'lauquang-doan.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR20H4hvL9fkVNsntWrQHKVEO6jZIyI4U',
    appId: '1:272633119424:android:64e2e24b26b1f23896a325',
    messagingSenderId: '272633119424',
    projectId: 'lauquang-doan',
    storageBucket: 'lauquang-doan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5tkmzNklnvBdpuqIkAFu_5Qr5jOY4faA',
    appId: '1:272633119424:ios:834addd359ed382d96a325',
    messagingSenderId: '272633119424',
    projectId: 'lauquang-doan',
    storageBucket: 'lauquang-doan.appspot.com',
    iosBundleId: 'com.example.lauquangDoan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5tkmzNklnvBdpuqIkAFu_5Qr5jOY4faA',
    appId: '1:272633119424:ios:de7c0c18b5ebe68e96a325',
    messagingSenderId: '272633119424',
    projectId: 'lauquang-doan',
    storageBucket: 'lauquang-doan.appspot.com',
    iosBundleId: 'com.example.lauquangDoan.RunnerTests',
  );
}
