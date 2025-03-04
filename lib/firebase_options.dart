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
    apiKey: 'AIzaSyCuJal3KXsUAtYSdt4TTD0-KqDkIqO_P4A',
    appId: '1:265617068882:web:85e8b3453d6f03c542208b',
    messagingSenderId: '265617068882',
    projectId: 'imagelabelingapp-30973',
    authDomain: 'imagelabelingapp-30973.firebaseapp.com',
    storageBucket: 'imagelabelingapp-30973.appspot.com',
    measurementId: 'G-CVZTT03R15',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASBXs1rzxUQ-kX2jgeKrUq9zaZsZ0nmtQ',
    appId: '1:265617068882:android:a854291bddac46c642208b',
    messagingSenderId: '265617068882',
    projectId: 'imagelabelingapp-30973',
    storageBucket: 'imagelabelingapp-30973.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAW_rGq1Ve7PfcwkOQlWiQ8nKPMZ3iC3Ag',
    appId: '1:265617068882:ios:863f4a94d6e5d28342208b',
    messagingSenderId: '265617068882',
    projectId: 'imagelabelingapp-30973',
    storageBucket: 'imagelabelingapp-30973.appspot.com',
    iosBundleId: 'com.example.imageLabelingApp', // Update if necessary
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAW_rGq1Ve7PfcwkOQlWiQ8nKPMZ3iC3Ag',
    appId: '1:265617068882:ios:863f4a94d6e5d28342208b',
    messagingSenderId: '265617068882',
    projectId: 'imagelabelingapp-30973',
    storageBucket: 'imagelabelingapp-30973.appspot.com',
    iosBundleId: 'com.example.imageLabelingApp', // Update if necessary
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCuJal3KXsUAtYSdt4TTD0-KqDkIqO_P4A',
    appId: '1:265617068882:web:5dc8e830e06e60dd42208b',
    messagingSenderId: '265617068882',
    projectId: 'imagelabelingapp-30973',
    authDomain: 'imagelabelingapp-30973.firebaseapp.com',
    storageBucket: 'imagelabelingapp-30973.appspot.com',
    measurementId: 'G-87WX0PYE7E',
  );
}
