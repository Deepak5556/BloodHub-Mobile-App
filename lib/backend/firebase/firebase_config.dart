import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyARJThLo3hKNqp7wtH59D_Qkck0s6gz_nA",
            authDomain: "donar-hnr8wa-453f7.firebaseapp.com",
            projectId: "donar-hnr8wa",
            storageBucket: "donar-hnr8wa.appspot.com",
            messagingSenderId: "654550111423",
            appId: "1:654550111423:web:9e0712f8cab46f87f0220a"));
  } else {
    await Firebase.initializeApp();
  }
}
