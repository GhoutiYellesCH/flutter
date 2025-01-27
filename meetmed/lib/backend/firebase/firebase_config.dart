import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9sEgj0Z3y2sbDtXHBTydFujy-7bIUQ5k",
            authDomain: "meetmed-99854.firebaseapp.com",
            projectId: "meetmed-99854",
            storageBucket: "meetmed-99854.firebasestorage.app",
            messagingSenderId: "295604976967",
            appId: "1:295604976967:web:20ffe0759fd5c409fa6062",
            measurementId: "G-N6W1FY4J28"));
  } else {
    await Firebase.initializeApp();
  }
}
