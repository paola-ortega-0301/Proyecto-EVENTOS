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
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNOvlDTjJqdBNtqJjgCDSmbS16q1qFQCM',
    appId: '1:27828630701:android:d02a0f7c8a103fb7fec224', // Usando el de android como base si no hay web
    messagingSenderId: '27828630701',
    projectId: 'empresaeventos-6bdbf',
    authDomain: 'empresaeventos-6bdbf.firebaseapp.com',
    storageBucket: 'empresaeventos-6bdbf.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNOvlDTjJqdBNtqJjgCDSmbS16q1qFQCM',
    appId: '1:27828630701:android:d02a0f7c8a103fb7fec224',
    messagingSenderId: '27828630701',
    projectId: 'empresaeventos-6bdbf',
    storageBucket: 'empresaeventos-6bdbf.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBNOvlDTjJqdBNtqJjgCDSmbS16q1qFQCM',
    appId: '1:27828630701:android:d02a0f7c8a103fb7fec224',
    messagingSenderId: '27828630701',
    projectId: 'empresaeventos-6bdbf',
    storageBucket: 'empresaeventos-6bdbf.firebasestorage.app',
  );
}
