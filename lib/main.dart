import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mars_exploration_game/phone_view/screens/phone_start_screen.dart';
import 'package:mars_exploration_game/screens/start_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'mars exploration game',
            home: 1.w>=1.h?StartScreen() : PhoneStartScreen(),
          );
        }
    );
  }
}
