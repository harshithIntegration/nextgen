import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 196, 186, 193);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
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
              'assets/Events.jpg',
              width: double.infinity,
              height: 250, // Increase height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24), // Space between image and content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildEventBox(
                    context,
                    title: 'Unparalleled Exposure',
                    content:
                        'Position your brand at the forefront of the industry, gaining visibility among a targeted audience of professionals and decision-makers who are seeking innovative solutions to enhance their manufacturing processes.',
                    imageName: 'assets/Unparalleled Exposure.png',
                    imageWidth: 120,
                    imageHeight: 120,
                    imageTop: -40,
                    titleTopMargin: 45,
                  ),
                  const SizedBox(height: 24), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Networking Opportunities',
                    content:
                        'Connect with industry leaders, potential clients, and partners. Strengthen existing relationships and build new ones through our structured networking events.',
                    imageName: 'assets/Networking Opportunities.png',
                    imageWidth: 110,
                    imageHeight: 110,
                    imageTop: -30,
                    titleTopMargin: 25,
                  ),
                  const SizedBox(height: 24), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Thought Leadership',
                    content:
                        'Establish your company as an industry leader by participating in panel discussions, workshops, and technical sessions. Share your expertise and insights with a captivated audience.',
                    imageName: 'assets/Thought Leadership.png',
                    imageWidth: 90,
                    imageHeight: 90,
                    imageTop: -30,
                    titleTopMargin: 20,
                  ),
                  const SizedBox(height: 24), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Lead Generation',
                    content:
                        'Benefit from direct access to key decision-makers and influencers in the manufacturing sector. Generate high-quality leads and drive business growth.',
                    imageName: 'assets/Lead Generation.png',
                    imageWidth: 90,
                    imageHeight: 90,
                    imageTop: -30,
                    titleTopMargin: 25,
                  ),
                  const SizedBox(
                      height: 24), // Space between boxes and main event section
                ],
              ),
            ),
            Container(
              color: Colors.black, // Change color for dark mode
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BECOME AN EXHIBITOR',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Color(0xFF8DE7E5),
                            Color(0xFFF7D98F),
                            Color(0xFFF497CF),
                            Color(0xFF9190F6),
                          ],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The summit is a prime opportunity for companies to showcase their innovative technologies, products, and services to a highly targeted audience of industry leaders, innovators, and decision-makers. As an exhibitor, you will have unparalleled access to a diverse group of professionals who are actively seeking solutions to enhance their manufacturing processes and operations.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Change text color for dark mode
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildEventBox(
                    context,
                    title: 'Brand Exposure',
                    content:
                        'Gain visibility and enhance your brandʼs recognition among industry peers and potential customers',
                    imageName: 'assets/Brand Exposure.png',
                    imageWidth: 70,
                    imageHeight: 70,
                    imageTop: -40,
                    titleTopMargin: 45,
                  ),
                  const SizedBox(height: 35), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Networking Opportunities',
                    content:
                        'Connect with key decision-makers, industry experts, and potential business partners.',
                    imageName: 'assets/Networking Opportunities.png',
                    imageWidth: 110,
                    imageHeight: 110,
                    imageTop: -30,
                    titleTopMargin: 25,
                  ),
                  const SizedBox(height: 35), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Lead Generation',
                    content:
                        'Generate high-quality leads by engaging with attendees who are specifically interested in smart manufacturing technologies.',
                    imageName: 'assets/Lead Generation.png',
                    imageWidth: 90,
                    imageHeight: 90,
                    imageTop: -30,
                    titleTopMargin: 25,
                  ),
                  const SizedBox(height: 45), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Product Demonstrations',
                    content:
                        'Showcase your products and solutions in a live setting, allowing potential customers to experience them firsthand.',
                    imageName: 'assets/Product Demonstrations.png',
                    imageWidth: 90,
                    imageHeight: 90,
                    imageTop: -30,
                    titleTopMargin: 25,
                  ),
                  const SizedBox(height: 35), // Space between boxes
                  buildEventBox(
                    context,
                    title: 'Thought Leadership',
                    content:
                        'Showcase your products and solutions in a live setting, allowing potential customers to experience them firsthand.',
                    imageName: 'assets/Thought Leadership.png',
                    imageWidth: 90,
                    imageHeight: 90,
                    imageTop: -30,
                    titleTopMargin: 20,
                  ),
                  const SizedBox(
                      height: 14), // Space between boxes and main event section
                ],
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
          ],
        ),
      ),
    );
  }

  Widget buildEventBox(
    BuildContext context, {
    required String title,
    required String content,
    required String imageName,
    required double imageWidth,
    required double imageHeight,
    required double imageTop,
    required double titleTopMargin,
  }) {
    final theme = Theme.of(context);

    final cardColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 222, 220, 220);
    final pageTextColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 104, 24, 154),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: imageHeight / 2 +
                      imageTop.abs() -
                      titleTopMargin), // Adjust height based on titleTopMargin
              Text(
                title,
                style: TextStyle(
                  color: pageTextColor, // Change text color for dark mode
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(
                  fontSize: 18,
                  color: pageTextColor, // Change text color for dark mode
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: imageTop,
          left: (MediaQuery.of(context).size.width - imageWidth) / 2 -
              32, // Adjust -32 based on container padding
          child: Image.asset(
            imageName,
            width: imageWidth, // Adjust width as needed
            height: imageHeight, // Adjust height as needed
          ),
        ),
      ],
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
