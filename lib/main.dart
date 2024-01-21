import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash.dart';
import 'screens/home.dart';
import 'screens/complaints.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasAcceptedPrivacyPolicy =
      prefs.getBool('hasAcceptedPrivacyPolicy') ?? false;

  runApp(MyApp(hasAcceptedPrivacyPolicy: hasAcceptedPrivacyPolicy));
}

class MyApp extends StatelessWidget {
  final bool hasAcceptedPrivacyPolicy;

  const MyApp({Key? key, required this.hasAcceptedPrivacyPolicy})
      : super(key: key);

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
        '/': (context) => Splash(
              onPrivacyPolicyAccepted: () {
                onPrivacyPolicyAccepted(context);
              },
            ),
        '/home': (context) => const HomeScreen(),
        '/ComplaintsScreen': (context) => const ComplaintsScreen(),
      },
    );
  }

  void onPrivacyPolicyAccepted(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasAcceptedPrivacyPolicy', true);

    Navigator.pushReplacementNamed(context, '/home');
  }
}
