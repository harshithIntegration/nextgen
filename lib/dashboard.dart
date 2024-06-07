import 'package:flutter/material.dart';
import 'package:nextgenmfg/aboutus.dart';
import 'package:nextgenmfg/contact.dart';
import 'package:nextgenmfg/event.dart';
import 'package:nextgenmfg/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // final Items item1 = Items(
  //   title: "Home",
  //   img: "assets/h.png",
  //   page: const Home(),
  // );

  final Items item2 = Items(
    title: "About",
    img: "assets/a.png",
    page: const AboutUsPage(),
  );

  final Items item3 = Items(
    title: "Contact",
    img: "assets/map.png",
    page: const ContactUs(),
  );

  final Items item4 = Items(
    title: "Event",
    img: "assets/festival.png",
    page: const EventPage(),
  );


  String imagePath = "assets/i1.jpg";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<Items> myList = [ item2, item3, item4];
    var color = Theme.of(context).cardColor;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 20,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkMode);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "NEXTGEN",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "MANUFACTURING SUMMIT 2024",
                        style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.8,
              padding: const EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: myList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: myList.map((data) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => data.page),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img,
                          width: 40,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.title,
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple[800]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NEXTGEN MANUFACTURING SUBMMIT 2024",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "➧Industry Experts",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Use theme text color
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "➧Exhibition",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Use theme text color
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "➧Networking",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Use theme text color
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "➧Best Practices Sharing",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Use theme text color
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "➧Technology Trends",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Use theme text color
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/1.jpg",
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      "USP of the Event",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple[800]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/f1.png",
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  "Exhibition",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "The Smart Manufacturing Exhibition is set to showcase the forefront of technological advancements and innovations in the field of smart manufacturing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple[800]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/f2.png",
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  "Conference",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "The Conference and workshops at The Smart Manufacturing Exhibition will cover a wide range of key topics that are crucial to the advancement of smart manufacturing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: 9.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple[800]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/f3.png",
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  "B2B",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "The B2B matchmaking platform is designed to connect exhibitors and attendees and schedule 1- on-1 business meetings with industry professionals.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.purple[800]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/one.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Meet Decision-Makers",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Foster synergy between technology enthusiasts and decision makers through new objectives aimed at driving technological progress.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.purple[800]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/two.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Networking",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Forge stronger business ties through connection establishment, fostering valuable partnerships that propel mutual growth and success.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontSize: 9.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.purple[800]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/five.jpg",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Solution Showcase",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Explore a solution showcase tailored to achieving new objectives through productivity enhancement, offering low-cost solutions for sustainable growth',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontSize: 9.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.purple[800]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/three.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Great Speakers",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Immerse yourself in thought-provoking discussions led by top speakers, trendsetters, and evangelists, shaping the future of innovation',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    "assets/f4.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      "Robotic Revolutionaries",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    "assets/f5.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/f6.jpg",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "Success in creating AI would be the biggest event in human history. Unfortunately, it might also be the last, unless we learn how to avoid the risks.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple[800]!),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "INDUSTRIAL TECHNOLOGIES IN FOCUS",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                "The Industrial Technologies in Focus covers advancements and applications in automation, IoT, AI, and additive manufacturing. It discusses Industry 4.0, smart factories, cybersecurity, and sustainability. The publication includes trends, case studies, expert interviews, and future forecasts, providing a comprehensive overview of the industrial technology landscape and its impact on various sectors.",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Icons
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.lightbulb),
                                  onPressed: () {
                                    setState(() {
                                      imagePath = "assets/i1.jpg";
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                IconButton(
                                  icon: const Icon(Icons.settings),
                                  onPressed: () {
                                    setState(() {
                                      imagePath = "assets/i2.jpg";
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                IconButton(
                                  icon: const Icon(Icons.computer_sharp),
                                  onPressed: () {
                                    setState(() {
                                      imagePath = "assets/i3.jpg";
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                IconButton(
                                  icon: const Icon(
                                      Icons.signal_cellular_alt_sharp),
                                  onPressed: () {
                                    setState(() {
                                      imagePath = "assets/i4.png";
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                IconButton(
                                  icon: const Icon(Icons.bubble_chart_rounded),
                                  onPressed: () {
                                    setState(() {
                                      imagePath = "assets/i5.png";
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Image.asset(
                                imagePath,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "EXPECTED SPEAKERS",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '"Great Speakers" explores public speaking mastery, featuring profiles of historical and modern influencers, techniques for speech writing and delivery, and tips for audience engagement. It includes analysis of famous speeches, interviews with expert speakers, and advice on overcoming nervousness and challenging audiences. The content also covers the role of technology in presentations and provides resources for continuous improvement.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCard('assets/1.jpg',
                          "Shrikant Prabhudesai\nPLANT HEAD GODREJ & BOYCE MFG. CO. LTD"),
                      _buildCard('assets/about.jpg',
                          "Kamna Sama\nIT DIRECTOR CUMMINS INDIA, PUNE"),
                      _buildCard('assets/contact.jpg',
                          "Prayukth K V\nMARKETING HEAD SECTRIO, INDIA"),
                      _buildCard('assets/event.jpg',
                          "Agendra Kumar\nMANAGING DIRECTOR ESRI INDIA"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}



Widget _buildCard(String imagePath, String description) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            height: 150,
            width: 180,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
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

// void _launchYoutubeURL() async {
//   const url = 'https://www.youtube.com/channel/UCbPVYK8X7RvuybcEPDY5HUg';
//   try {
//     await launch(url);
//   } catch (e) {
//     print('Error launching URL: $e');
//   }
// }

class Items {
  final String title;
  final String img;
  final Widget page;

  Items({required this.title, required this.img, required this.page});
}
