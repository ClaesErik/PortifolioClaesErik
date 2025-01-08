import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../res/globals.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Globals.accentColor,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(Globals.avatarCircleImage),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Claes Erik", 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Globals.instagramIcon,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    width: 35.0,
                  ),
                  onPressed: () async {
                    await launchUrl(Uri.parse(Globals.instaURL));
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Globals.githubIcon,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    width: 35.0,
                  ),
                  onPressed: () async {
                    await launchUrl(Uri.parse(Globals.githubURL));
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Globals.linkedinIcon,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    width: 35.0,
                  ),
                  onPressed: () async {
                    await launchUrl(Uri.parse(Globals.linkedinURL));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: Row(
          children: [
            Spacer(),
            TabsWeb(
                title: "Home", accentColor: Globals.accentColor, route: '/'),
            Spacer(),
            TabsWeb(
                title: "Works",
                accentColor: Globals.accentColor,
                route: '/works'),
            Spacer(),
            TabsWeb(
                title: "Blog",
                accentColor: Globals.accentColor,
                route: '/blog'),
            Spacer(),
            TabsWeb(
                title: "About",
                accentColor: Globals.accentColor,
                route: '/about'),
            Spacer(),
            TabsWeb(
                title: "Contact",
                accentColor: Globals.accentColor,
                route: '/contact'),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          //About Me, first Section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "Hello I'm Claes Erik, I specialize in flutter development",
                        15.0),
                    Sans(
                        "i strive to ensure astounding performance with state of",
                        15.0),
                    Sans(
                        "the art security for Android, Ios, Web, Mac, Linux and Windows",
                        15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        AccentBoxSkills(text: "Flutter"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Firebase"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Android"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "IOs"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Windows"),
                        SizedBox(width: 7.0),
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 187.0,
                  backgroundColor: Globals.accentColor,
                  child: CircleAvatar(
                    radius: 183.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 180.0,
                      child: Image.asset(
                        Globals.avatarCircleImage,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Web development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: Globals.webImagePath,
                accentColor: Globals.accentColor,
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Web development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "I'm here to build your presence online with state of the art of web.",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),

          //App development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("App Development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                        15.0),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: Globals.appExImagePath,
                accentColor: Globals.accentColor,
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          SizedBox(height: 20.0),

          //Back-end development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: Globals.firebaseImagePath,
                accentColor: Globals.accentColor,
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Back-end development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 90.0),
        ],
      ),
    );
  }
}
