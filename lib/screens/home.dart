import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffffffff), Color(0xffEFF1F5)],
              stops: [0, 1])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //welcome
                const Padding(
                  padding: EdgeInsets.only(top: 54.0, bottom: 15.0, left: 25.0),
                  child: Text(
                    'Welcome,',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff171930),
                        fontFamily: 'Inter',
                        fontSize: 31,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1.2592592592592593),
                  ),
                  // card with title "Complaint Box"
                ),
                const SizedBox(height: 20.0),
                // card with title "Complaint Box"
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, '/ComplaintsScreen'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.warning),
                            title: Text(
                              'Complaint Box',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Click here to file a complaint on any member of our STM. Your identity will be kept anonymous.',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Blood Requests card
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/blood'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.local_hospital),
                            title: Text(
                              'Blood Requests',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Click here to request for blood. Our team will contact you as soon as possible.',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Others or Suggestions card
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/others'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.feedback),
                            title: Text(
                              'Others or Suggestions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Click here to send us your suggestions or any other queries.',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 10.0),
                // footer image
                Stack(
                  children: [
                    Image.asset(
                      'lib/images/logo.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Designed and Developed by Weber Technologies',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
