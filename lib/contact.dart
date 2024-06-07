import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 222, 220, 220);
    final pageTextColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final appBarColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 196, 186, 193);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
        backgroundColor: appBarColor,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/ContactUs.jpg',
              width: double.infinity,
              height: 250, // Increase height to your preference
              fit: BoxFit.cover,
            ),
            const SizedBox(
                height: 24), // Increased spacing between image and content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 104, 24, 154),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'info@nextgenmfg.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: pageTextColor, // Text color for light mode
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '+91 9606445499',
                            style: TextStyle(
                              fontSize: 18,
                              color: pageTextColor // Text color for light mode
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '49 Ravish Gardenia, Ravish Mangroves Vaderahalli, Post, Vidyaranyapura, Bengaluru, 560097',
                            style: TextStyle(
                              fontSize: 18,
                              color: pageTextColor, // Text color for light mode
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 56, 63, 68),
              child: Center(
                child: Image.asset(
                  'assets/logo1.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 56, 63, 68),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchInstagramURL();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        'assets/instagram.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchFacebookURL();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        'assets/face.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchTwitterURL();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        'assets/twitter.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchLinkedInURL();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        'assets/link.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 56, 63, 68),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '© 2024 NextGen Manufacturing Summit 2024.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}


void _launchInstagramURL() async {
  const url =
      'https://www.instagram.com/planotecheventsmarketing?igsh=MWtxY2p0eGVjNW93eA==';
  try {
    await launch(url);
  } catch (e) {
    print('Error launching URL: $e');
  }
}

void _launchFacebookURL() async {
  const url = 'https://www.facebook.com/profile.php?id=61555728180434';
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // If the Facebook app is not installed, open the browser
      await launch('https://www.facebook.com/profile.php?id=61555728180434');
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}

void _launchTwitterURL() async {
  const url = 'https://twitter.com/Planotech395091';
  try {
    await launch(url);
  } catch (e) {
    print('Error launching URL: $e');
  }
}

void _launchLinkedInURL() async {
  const url = 'https://www.linkedin.com/in/planotech-services-fzco-2455ba2b0/';
  try {
    await launch(url);
  } catch (e) {
    print('Error launching URL: $e');
  }
}
