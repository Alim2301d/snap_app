import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_app/firebase_options.dart';

import 'pages/SplashPage.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Snap_app());
}

class Snap_app extends StatelessWidget {
  const Snap_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap App',
      debugShowCheckedModeBanner: false,
      home :const SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.lightBlue[900],
        appBarTheme:AppBarTheme(
          color: Colors.lightBlue[600],
          backgroundColor: Colors.lightBlue[850]
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Gothic', color: Colors.greenAccent),
          bodyMedium: TextStyle(fontFamily: 'Gothic', color: Colors.greenAccent),
          bodySmall: TextStyle(fontFamily: 'Gothic', color: Colors.greenAccent),

          titleLarge: TextStyle(fontFamily: 'Gothic', color: Colors.orange),
          titleMedium: TextStyle(fontFamily: 'Gothic', color: Colors.orange),
          titleSmall: TextStyle(fontFamily: 'Gothic', color: Colors.orange),
        )
      ),
    );
  }
}
