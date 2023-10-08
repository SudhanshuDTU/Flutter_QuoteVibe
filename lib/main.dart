import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:quotevibe/Views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyB32YFGTf1dQh9z5lrVFU0XYt67Pnn-jJo",
      appId: "1:229872779333:web:cc658e4377bbb51777232c",
      messagingSenderId: "229872779333",
      projectId: "quotevibe-dc3e0",
      authDomain: "quotevibe-dc3e0.firebaseapp.com",
      storageBucket: "quotevibe-dc3e0.appspot.com",
    ));
  }
  await Firebase.initializeApp();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("2bab10df-0ba3-4c61-9360-b02db65f8c90");
  OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuoteVibe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
