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
    apiKey: 'AIzaSyAEF8dKZZMV7tHfCZUn_DYDdURwmK_jCrk',
    appId: '1:198302931681:web:2ebb5e5a649a90c4fa75a0',
    messagingSenderId: '198302931681',
    projectId: 'myflutter-new-project-8ede3',
    authDomain: 'myflutter-new-project-8ede3.firebaseapp.com',
    storageBucket: 'myflutter-new-project-8ede3.firebasestorage.app',
    measurementId: 'G-6R3BRREXN9',
  );

  // Replace these placeholder values with your actual Firebase configuration

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_Fpi25b0hdBPm_sBFJgOxBjbmI1glO7E',
    appId: '1:198302931681:android:de3659af0f0272bafa75a0',
    messagingSenderId: '198302931681',
    projectId: 'myflutter-new-project-8ede3',
    storageBucket: 'myflutter-new-project-8ede3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_STORAGE_BUCKET',
    iosClientId: 'YOUR_IOS_CLIENT_ID',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_STORAGE_BUCKET',
    iosClientId: 'YOUR_IOS_CLIENT_ID',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAEF8dKZZMV7tHfCZUn_DYDdURwmK_jCrk',
    appId: '1:198302931681:web:ea4896de8174cf91fa75a0',
    messagingSenderId: '198302931681',
    projectId: 'myflutter-new-project-8ede3',
    authDomain: 'myflutter-new-project-8ede3.firebaseapp.com',
    storageBucket: 'myflutter-new-project-8ede3.firebasestorage.app',
    measurementId: 'G-4FNRBDBLM9',
  );

}