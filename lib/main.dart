import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterexp1/FirstScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo App',
      home: AnimatedSplashScreen(
        splash: Image.asset('./assets/splash_screen_img.png'),
        nextScreen: FirstScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
