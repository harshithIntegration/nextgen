import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimationLeftToRight;
  late Animation<Offset> _offsetAnimationRightToLeft;
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _offsetAnimationLeftToRight = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _offsetAnimationRightToLeft = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    _pageController = PageController(initialPage: _currentPage);

    // Automatically scroll to the next page every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.brown;
    final cardColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 222, 220, 220);
    final containerColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 214, 183, 183);
    final pageTextColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final appBarColor = theme.brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(255, 196, 186, 193);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: Colors.black,
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
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.asset(
                'assets/about.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _offsetAnimationLeftToRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 104, 24, 154),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'INNOVATE | AUTOMATE | DOMINATE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 104, 24, 154),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Develop Smart Manufacturing Ecosystems :',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              child: Image.asset(
                                'assets/next1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'The NextGen Manufacturing Summit 2024 is the premier event dedicated to the advancement of manufacturing technologies and practices. This summit brings together leading industry experts, innovators, and decision-makers to explore the transformative potential of smart manufacturing. Over three dynamic days, participants will engage in insightful discussions, attend cutting-edge presentations, and network with peers who are at the forefront of this industrial revolution.',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: pageTextColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _offsetAnimationRightToLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 104, 24, 154),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '➤  Proposed Sessions  :',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 222, 220, 220),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 104, 24, 154),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Image.asset(
                            'assets/next2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Industry 4.0: Delving into the integration of IoT, AI, and machine learning to revolutionize manufacturing processes.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Automation and Robotics: Exploring the latest advancements in robotic systems and their application in enhancing production efficiency.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Digital Twins: Understanding the role of digital twin technology in optimizing manufacturing operations.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★Cybersecurity: Strategies to safeguard smart factories against evolving cyber threats.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Sustainable Manufacturing: Innovations and practices for environmentally responsible manufacturing.',
                        style: TextStyle(
                          fontSize: 15.23,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Additive Manufacturing: The latest trends and industrial applications of 3D printing technology.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '★ Supply Chain Resilience: Strategies to build robust and adaptable supply chains in the face of global disruptions.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: pageTextColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    enableInfiniteScroll: true,
                    viewportFraction: 0.9,
                    aspectRatio: 0.8 / 1.15,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    {
                      'image': 'assets/one.png',
                      'title': 'Meet Decision-Makers',
                      'subtitle':
                          'Foster synergy between technology enthusiasts and decision makers through new objectives aimed at driving technological progress.',
                    },
                    {
                      'image': 'assets/two.png',
                      'title': 'Networking',
                      'subtitle':
                          'Forge stronger business ties through connection establishment, fostering valuable partnerships that propel mutual growth and success.',
                    },
                    {
                      'image': 'assets/three.jpg',
                      'title': 'Great Speakers',
                      'subtitle':
                          'Immerse yourself in thought-provoking discussions led by top speakers, trendsetters, and evangelists, shaping the future of innovation.',
                    },
                    {
                      'image': 'assets/four.png',
                      'title': 'Solution Showcase',
                      'subtitle':
                          'Explore a solution showcase tailored to achieving new objectives through productivity enhancement, offering low-cost solutions for sustainable growth.',
                    },
                  ].map((item) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.all(
                          15.0), // Optional padding to separate content from the container's edge
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color:
                            containerColor, // Background color for the container
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 104, 24, 154),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              item['title']!,
                              style: TextStyle(
                                color: pageTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          AspectRatio(
                            aspectRatio: 1.2,
                            child: ClipOval(
                              child: Image.asset(
                                item['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Text(
                            item['subtitle']!,
                            style: TextStyle(
                              color: pageTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 12),
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/system.webp',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 7,
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 226, 31, 250),
                          Colors.yellow,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'TRANSFORMING TOMORROW TOGETHER',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white, // Text color for light mode
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 7,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.1),
                    child: const Center(
                      child: Text(
                        '\n\n                                 ★★★★★',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 7,
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width - 14,
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.black.withOpacity(0.1),
                          child: const Text(
                            'NextGen AI in smart manufacturing \nrevolutionizes efficiency, drives cost \nsavings, and enhances product quality.',
                            style: TextStyle(
                              color: Colors.white, // Text color for light mode
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.black.withOpacity(0.1),
                          child: const Text(
                            'Discover cutting-edge AI innovations,\nexplore transformative industry solutions,\nand network with visionary leaders at \nNextGen Expo.',
                            style: TextStyle(
                              color: Colors.white, // Text color for light mode
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.black.withOpacity(0.1),
                          child: const Text(
                            'Join NextGen Expo: Unveil cutting-edge \nAI innovations, explore lucrative \ninvestment opportunities and shape the \nfuture of smart manufacturing.',
                            style: TextStyle(
                              color: Colors.white, // Text color for light mode
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('assets/11.webp', width: 250, height: 250),
                  const SizedBox(width: 10),
                  Image.asset('assets/22.webp', width: 250, height: 250),
                  const SizedBox(width: 10),
                  Image.asset('assets/33.webp', width: 250, height: 250),
                  const SizedBox(width: 10),
                  Image.asset('assets/44.png', width: 250, height: 250),
                  const SizedBox(width: 10),
                  Image.asset('assets/55.png', width: 250, height: 250),
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
            ),          ],

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
