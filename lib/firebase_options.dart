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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCFqrErQyK2xSNU7DNnkaOnmup3mna82Q8',
    appId: '1:749711859851:web:d10ad7b6e206c0412a748e',
    messagingSenderId: '749711859851',
    projectId: 'gizmomart-3200a',
    authDomain: 'gizmomart-3200a.firebaseapp.com',
    storageBucket: 'gizmomart-3200a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcLaayCswKw_XkEi5KXpsUbTD5XKhtPVk',
    appId: '1:749711859851:android:9b6934185654b93f2a748e',
    messagingSenderId: '749711859851',
    projectId: 'gizmomart-3200a',
    storageBucket: 'gizmomart-3200a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMDjNzsVVDZqGTj73_QrTNblZVv7pSjAw',
    appId: '1:749711859851:ios:b9a30b2e879f2a872a748e',
    messagingSenderId: '749711859851',
    projectId: 'gizmomart-3200a',
    storageBucket: 'gizmomart-3200a.appspot.com',
    iosBundleId: 'com.example.practice',
  );
}