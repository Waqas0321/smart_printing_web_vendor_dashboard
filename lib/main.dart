import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'App/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCoYBuhKL6QEtej0sEioFKGuMbSNGeQGBY",
          authDomain: "tellmeapp-f9f0a.firebaseapp.com",
          projectId: "tellmeapp-f9f0a",
          storageBucket: "tellmeapp-f9f0a.appspot.com",
          messagingSenderId: "240195487829",
          appId: "1:240195487829:web:943695643d62bd18926cdc",
          measurementId: "G-D4M3K7GXY3"
      ),
    );
  }
  runApp(const MyApp());
}
