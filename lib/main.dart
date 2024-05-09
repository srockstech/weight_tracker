// Create a weight tracker application that operates fully offline.
// The app lets users create a profile on the very first launch. Collect username for simplicity.
// After the profile creation, the app shows a page where users can:
// ● Enter his/her weight in Kilograms → save this in a database on the client
// ● View a list of all weight entries, and sort based on entry time.
// ● A simple line graph to show weight changes in X months.
// Bonus features:
// ● Edit an entry
// ● Switch between user profiles
// Instructions:
// ● Use some dependency injection frameworks like get_it, if required
// ● Feel free to offload db queries into a separate isolate if required.
// ● For plotting the line chart, use some packages available: https://pub.dev/packages
// ● When building the UI and navigating between screens, choose the approach that makes
// the most sense in terms of usability.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/views/welcome_screen.dart';
import 'package:weight_tracker/views/weight_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupLocator();
  await hiveLocalDb.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WelcomeScreen(),
        WeightScreen.id: (context) => const WeightScreen(),
      },
    );
  }
}
