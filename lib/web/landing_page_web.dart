import 'package:claes_erik/components.dart';
import 'package:claes_erik/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
          /**
            FirstSection Introduction (Photo and contacts)
           */
          Container(
            height: heightDevice - 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Globals.accentColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SizedBox(height: 15.0),
                    SansBold("Claes Erik", 55.0),
                    Sans("Flutter developer", 30.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("claeserikjr@gmail.com", 15.0)
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans("+55 85 98113-4321", 15.0)
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("Praia Grande, SP - Brazil", 15.0)
                      ],
                    ),
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
                      backgroundImage: AssetImage(Globals.avatarCircleImage),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /**
           * SecondSection About Me and Skills
           */
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/web.jpg",
                  height: widthDevice / 1.9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
                    Sans(Globals.userIntro, 15),
                    Sans(Globals.userIntro2, 15),
                    Sans(Globals.userIntro3, 15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        AccentBoxSkills(text: "Flutter"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Android"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Web"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Back-end"),
                        SizedBox(width: 7.0),
                        AccentBoxSkills(text: "Firebase"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          /**
           * ThirdSection What i do
           */
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                        imagePath: "assets/webL.png",
                        text: "Web Development",
                        subtext: "(React and Flutter)",
                        accentColor: Globals.accentColor),
                    AnimatedCard(
                        imagePath: "assets/app.png",
                        text: "App Development",
                        subtext: "(Android Native and Flutter)",
                        fit: BoxFit.contain,
                        reverse: true,
                        accentColor: Globals.accentColor),
                    AnimatedCard(
                        imagePath: "assets/firebase.png",
                        text: "Back-end Development",
                        subtext: "(Firebase and JavaSpring)",
                        accentColor: Globals.accentColor),
                  ],
                )
              ],
            ),
          ),
          /**
           * Forth Section Contact Me
           */
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact Me", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          accentColor: Globals.accentColor,
                          containersWidth: 350.0,
                          text: "First Name",
                          hintext: "Please enter your first name",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            accentColor: Globals.accentColor,
                            text: "Email",
                            containersWidth: 350.0,
                            hintext: "Please enter your email address")
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          accentColor: Globals.accentColor,
                          text: "Last Name",
                          containersWidth: 350.0,
                          hintext: "Please type you last name",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            accentColor: Globals.accentColor,
                            text: "Phone Number",
                            containersWidth: 350.0,
                            hintext: "Please type your phone number"),
                      ],
                    )
                  ],
                ),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Message",
                  containersWidth: widthDevice / 1.6,
                  hintext: "Please type your message",
                  maxLines: 10,
                ),
                MaterialButton(
                  height: 60.0,
                  minWidth: 200.0,
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Globals.accentColor,
                  child: SansBold("Submit", 20.0),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
