import 'package:flutter/material.dart';
import 'package:askstm/screens/splash.dart';
import 'package:askstm/screens/home.dart';
import 'package:askstm/screens/complaints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ask STM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const HomeScreen(),
        '/ComplaintsScreen': (context) => const ComplaintsScreen(),
      },
    );
  }
}
