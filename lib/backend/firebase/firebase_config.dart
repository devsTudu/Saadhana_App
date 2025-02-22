import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCk8w85rTlSNDhYihYPB1oqQmzBW0MDJQ0",
            authDomain: "saadhanaapp.firebaseapp.com",
            projectId: "saadhanaapp",
            storageBucket: "saadhanaapp.firebasestorage.app",
            messagingSenderId: "512411755807",
            appId: "1:512411755807:web:f81fe4ab5d7f833580bc2a",
            measurementId: "G-F54F7V9ZBH"));
  } else {
    await Firebase.initializeApp();
  }
}
