// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA20guy9pZvJdK2gLR7Byam8kZMlMm4tU8',
    appId: '1:624346170728:web:fe9da032eac8ba87b242dd',
    messagingSenderId: '624346170728',
    projectId: 'tmexpress101',
    authDomain: 'tmexpress101.firebaseapp.com',
    storageBucket: 'tmexpress101.appspot.com',
    measurementId: 'G-EN4H2ZPT7C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl8iMM-bOgf4tkNxKru7wUBy60liy-laI',
    appId: '1:624346170728:android:31259c4f27a262c9b242dd',
    messagingSenderId: '624346170728',
    projectId: 'tmexpress101',
    storageBucket: 'tmexpress101.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZhBtwwLWBzsPHqN9M_x5E7Ye5nt2zIhc',
    appId: '1:624346170728:ios:bcded2a89071623cb242dd',
    messagingSenderId: '624346170728',
    projectId: 'tmexpress101',
    storageBucket: 'tmexpress101.appspot.com',
    iosClientId: '624346170728-q5avkoctq2370d99etefb64hjr5skrk4.apps.googleusercontent.com',
    iosBundleId: 'com.zehinz.tmexpress',
  );
}
