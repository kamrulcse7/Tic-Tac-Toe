import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      home: SafeArea(
        child: SplashScreen(),
      ), 
    );
  }
}
