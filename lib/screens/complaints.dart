import 'dart:convert';

import 'package:askstm/constants.dart';
import 'package:askstm/screens/thankyoupage.dart';
// import 'package:askstm/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(const MyApp());

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  _ComplaintsScreenState createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _mobile;
  late String _complaint;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare data to be sent in the POST request
      final Map<String, String> data = {
        'name': _name,
        'email': _email,
        'mobile': _mobile,
        'complaints': _complaint,
      };

      // Send a POST request to the API endpoint
      final response = await http.post(
        Uri.parse('https://apis.stmorg.in/complaints/add_complaints'),
        body: data,
      );

      // Handle the response as needed
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == 'success') {
          // Successful request, show the application ID and navigate to the thank you page
          final int applicationId = jsonResponse['data'];
          // print(
          //     'Complaint submitted successfully! Application ID: $applicationId');

          // Navigate to the thank you page with the application ID
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThankYouPage(applicationId: applicationId),
            ),
          );
        } else {
          // Handle unsuccessful request
          // print('Error submitting complaint: ${jsonResponse['status']}');
        }
      } else {
        // Handle errors or unsuccessful request
        // print(
        //     'Error submitting complaint. Status code: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pop(); // Navigate back when arrow is tapped
                  },
                  child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                ),
                Image.asset("assets/images/logo.png", height: 35),
              ],
            ),

            const SizedBox(height: 30),
            const Text("Complaints Form,", style: kHeadingextStyle),
            const Text("ICC will contact you directly.",
                style: kSubheadingextStyle),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 30),
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            //   height: 60,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: const Color(0xFFF5F5F7),
            //     borderRadius: BorderRadius.circular(40),
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       SvgPicture.asset("assets/icons/search.svg"),
            //       const SizedBox(width: 16),
            //       const Text(
            //         "Search for anything",
            //         style: TextStyle(
            //           fontSize: 18,
            //           color: Color(0xFFA0A5BD),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$')
                          .hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mobile = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines:
                        5, // Increase the number of lines for the complaint field
                    decoration: const InputDecoration(
                      labelText: 'Complaint',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your complaint';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _complaint = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      // onPressed: () {
                      //   if (_formKey.currentState!.validate()) {
                      //     _formKey.currentState!.save();
                      //     _submitForm;
                      //   }
                      // },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ComplaintsScreen(),
  ));
}
