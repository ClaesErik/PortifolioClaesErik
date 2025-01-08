import 'package:claes_erik/components.dart';
import 'package:claes_erik/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset('assets/perfil-circle.png'),
              ),
            ),
            TabsMobile(text: "Home", route: '/'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: '/works'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Blog", route: '/blog'),
            SizedBox(height: 20.0),
            TabsMobile(text: "About", route: '/about'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Contact", route: '/contact'),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () async =>
                          await launchUrl(Uri.parse(Globals.instaURL)),
                      icon: SvgPicture.asset(
                        Globals.instagramIcon,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        width: 35.0,
                      )),
                  IconButton(
                      onPressed: () async =>
                          await launchUrl(Uri.parse(Globals.githubURL)),
                      icon: SvgPicture.asset(
                        Globals.githubIcon,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        width: 35.0,
                      )),
                  IconButton(
                      onPressed: () async =>
                          await launchUrl(Uri.parse(Globals.linkedinURL)),
                      icon: SvgPicture.asset(
                        Globals.linkedinIcon,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        width: 35.0,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            ///Introduction, first section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Globals.accentColor,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    Globals.avatarCircleImage,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About Me", 35.0),
                  SizedBox(height: 10.0),
                  Sans(Globals.userIntro, 15.0),
                  Sans(Globals.userIntro2, 15.0),
                  Sans(Globals.userIntro3, 15.0),
                  SizedBox(height: 10.0),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      AccentBoxSkills(text: "Flutter"),
                      AccentBoxSkills(text: "Android"),
                      AccentBoxSkills(text: "Web"),
                      AccentBoxSkills(text: "Back-end"),
                      AccentBoxSkills(text: "Firebase"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0),

            //Web development, second section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  accentColor: Globals.accentColor,
                  imagePath: Globals.webImagePath,
                  width: 200.0,
                ),
                SizedBox(height: 30.0),
                SansBold("Web Development", 20.0),
                SizedBox(height: 10.0),
              ],
            ),
            Sans(
                "I'm here to buuiild your presence online with state of the art of web.",
                15.0),

            //App development, third section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                AnimatedCard(
                  imagePath: Globals.appExImagePath,
                  accentColor: Globals.accentColor,
                  width: 200.0,
                  reverse: true,
                ),
                SizedBox(height: 30.0),
                SansBold("App development", 20.0),
                SizedBox(height: 10.0),
              ],
            ),
            Sans(
                "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                15.0),

            //Mobile Development, fourth section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                AnimatedCard(
                  imagePath: Globals.firebaseImagePath,
                  accentColor: Globals.accentColor,
                  width: 200.0,
                  reverse: true,
                ),
                SizedBox(height: 30.0),
                SansBold("Back-end development", 20.0),
                SizedBox(height: 10.0),
              ],
            ),
            Sans(
                "Do you want your back-end to be highly scalabel and secure? Let's have a conversation on how I can help you with that.",
                15.0),
          ],
        ),
      ),
    ));
  }
}
