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
    apiKey: 'AIzaSyDOLqePJJqfYhjkenUo14spUf_0SrDIIdM',
    appId: '1:551262484923:web:20b03c89051ce444f9ac9e',
    messagingSenderId: '551262484923',
    projectId: 'jobsque-8f0dc',
    authDomain: 'jobsque-8f0dc.firebaseapp.com',
    storageBucket: 'jobsque-8f0dc.appspot.com',
    measurementId: 'G-M2ZBD319SJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVJyLuiDAsY4-8ILfCUPEOW71rgvgfntc',
    appId: '1:551262484923:android:a7d967a689552e9ef9ac9e',
    messagingSenderId: '551262484923',
    projectId: 'jobsque-8f0dc',
    storageBucket: 'jobsque-8f0dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVKq2YPrY2wwa3zFO1674HsHV3C6zSkmQ',
    appId: '1:551262484923:ios:19a6c612bf6df249f9ac9e',
    messagingSenderId: '551262484923',
    projectId: 'jobsque-8f0dc',
    storageBucket: 'jobsque-8f0dc.appspot.com',
    androidClientId: '551262484923-1df7vlajoq36rf8iavtturrlgblgvad6.apps.googleusercontent.com',
    iosClientId: '551262484923-jtk4femv1ui4fhoolhud3h3o2mpcjv99.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobsque',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVKq2YPrY2wwa3zFO1674HsHV3C6zSkmQ',
    appId: '1:551262484923:ios:19a6c612bf6df249f9ac9e',
    messagingSenderId: '551262484923',
    projectId: 'jobsque-8f0dc',
    storageBucket: 'jobsque-8f0dc.appspot.com',
    androidClientId: '551262484923-1df7vlajoq36rf8iavtturrlgblgvad6.apps.googleusercontent.com',
    iosClientId: '551262484923-jtk4femv1ui4fhoolhud3h3o2mpcjv99.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobsque',
  );
}
