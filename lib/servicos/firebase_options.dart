import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: "AIzaSyBYzKvTWx__3VM068n5h7EjiOsWXfM2qbQ",
    authDomain: "app-canal-35bfe.firebaseapp.com",
    projectId: "app-canal-35bfe",
    storageBucket: "app-canal-35bfe.firebasestorage.app",
    messagingSenderId: "929820335166",
    appId: "1:929820335166:web:ab06b16ff197508015856f",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYzKvTWx__3VM068n5h7EjiOsWXfM2qbQ',
    appId: '1:929820335166:android:5dab45d62ebfa01115856f',
    messagingSenderId: '929820335166',
    projectId: 'app-canal-35bfe',
    storageBucket: 'app-canal-35bfe.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
    iosClientId: '',
    iosBundleId: '',
  );
}
