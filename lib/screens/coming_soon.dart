import 'package:askstm/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AskSTM',
      theme: ThemeData(),
      home: const ComingSoon(),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/coming_soon.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Service To Mankind',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our developers are doing their best to give you the best experience.',
                textAlign: TextAlign.center,
                style: kSubtitleTextSyule,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
