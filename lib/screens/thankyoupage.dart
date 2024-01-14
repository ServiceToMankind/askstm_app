import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  final int applicationId;

  const ThankYouPage({required this.applicationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Thank you for submitting your complaint! '),
              const SizedBox(height: 20),
              Text('Your Application ID: $applicationId'),
              const SizedBox(height: 10),
              const Text(
                'Note: Please do not send multiple submissions. Our ICC member will reach you as soon as possible.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/home'),
                  );
                },
                child: const Text('Go back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
