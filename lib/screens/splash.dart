import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash extends StatefulWidget {
  final VoidCallback onPrivacyPolicyAccepted;

  const Splash({Key? key, required this.onPrivacyPolicyAccepted})
      : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkPrivacyPolicyAcceptance();
  }

  void checkPrivacyPolicyAcceptance() async {
    // Simulate some async task, like checking for user data or other initializations
    await Future.delayed(const Duration(seconds: 3));

    // Retrieve the privacy policy acceptance status
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasAcceptedPrivacyPolicy =
        prefs.getBool('hasAcceptedPrivacyPolicy') ?? false;

    if (hasAcceptedPrivacyPolicy) {
      // If the privacy policy has been accepted, navigate to the home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // If the privacy policy hasn't been accepted, show the privacy policy
      // and provide a callback to trigger acceptance
      showPrivacyPolicy();
    }
  }

  void showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '''
                Privacy Policy
                Effective Date: 01-01-2024

                Introduction
                Thank you for using our mobile application ("the App"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our App.

                Information We Collect
                Personal Information
                The App collects the following personal information for the purpose of submitting complaints:

                Name
                Email
                Mobile Number
                This information is collected only when you voluntarily provide it to us through the complaint submission form within the App.

                Non-personal Information
                We also do not collect non-personal information such as device information, usage statistics, and other technical data to improve the App's functionality and user experience.

                How We Use Your Information
                The personal information collected is used solely for the purpose of submitting and managing complaints. We do not share this information with third parties unless required by law.

                Security
                We prioritize the security of your personal information and implement reasonable measures to protect it from unauthorized access, disclosure, alteration, and destruction.

                Your Choices
                You can choose not to provide certain personal information, but this may limit your ability to use certain features of the App.

                Changes to This Privacy Policy
                We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.

                Contact Us
                If you have any questions or concerns about our Privacy Policy, please contact us at reach@stmorg.in.

                By using the App, you agree to the terms and conditions of this Privacy Policy.
                ''',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Trigger the privacy policy acceptance
                    widget.onPrivacyPolicyAccepted();
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('Accept'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    launch('https://ask.stmorg.in/privacy_policy');
                  },
                  child: const Text('View Full Privacy Policy'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // png image
                  child: Image.asset(
                    "lib/images/logo.png",
                    height: 180,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
