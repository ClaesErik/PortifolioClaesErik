import 'package:claes_erik/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  final accentColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
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
            TabsWeb("Home", accentColor),
            Spacer(),
            TabsWeb("Works", accentColor),
            Spacer(),
            TabsWeb("Blog", accentColor),
            Spacer(),
            TabsWeb("About", accentColor),
            Spacer(),
            TabsWeb("Contact", accentColor),
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
                        color: accentColor,
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
                  backgroundColor: accentColor,
                  child: CircleAvatar(
                    radius: 183.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 180.0,
                      backgroundImage:
                          AssetImage("assets/Claes_foto_3_por_4-circle.png"),
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
                    Sans(
                        "Hello! I'm Claes Erik, Flutter, React Native and Android developer",
                        15),
                    Sans(
                        "I strive to ensure astounding performance with state of ",
                        15),
                    Sans("The art security for Android, IOS and Web ", 15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: accentColor,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Flutter", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: accentColor,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Android", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: accentColor,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Web", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: accentColor,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Back-end", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: accentColor,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Firebase", 15.0),
                        ),
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
                    AnimatedCardWeb(
                        imagePath: "assets/webL.png",
                        text: "Web Development",
                        subtext: "(React and Flutter)",
                        accentColor: accentColor),
                    AnimatedCardWeb(
                        imagePath: "assets/app.png",
                        text: "App Development",
                        subtext: "(Android Native and Flutter)",
                        fit: BoxFit.contain,
                        reverse: true,
                        accentColor: accentColor),
                    AnimatedCardWeb(
                        imagePath: "assets/firebase.png",
                        text: "Back-end Development",
                        subtext: "(Firebase and JavaSpring)",
                        accentColor: accentColor),
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
                          accentColor: accentColor,
                          width: 350.0,
                          heading: "First Name",
                          hintext: "Please enter your first name",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            accentColor: accentColor,
                            heading: "Email",
                            width: 350.0,
                            hintext: "Please enter your email address")
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          accentColor: accentColor,
                          heading: "Last Name",
                          width: 350.0,
                          hintext: "Please type you last name",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            accentColor: accentColor,
                            heading: "Phone Number",
                            width: 350.0,
                            hintext: "Please type your phone number"),
                      ],
                    )
                  ],
                ),
                TextForm(
                  accentColor: accentColor,
                  heading: "Message",
                  width: widthDevice / 1.6,
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
                  color: accentColor,
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
