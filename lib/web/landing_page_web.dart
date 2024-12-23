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
            height: heightDevice - 56,
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
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: SansBold("Hello I'm", 15),
                    ),
                    SizedBox(height: 15),
                    SansBold("Claes Erik", 55),
                    Sans("Flutter developer", 30),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans("claeserikjr@gmail.com", 15)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans("+55 85 98113-4321", 15)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans("Praia Grande, SP - Brazil", 15)
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: accentColor,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 140,
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
                  height: heightDevice / 1.7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40),
                    SizedBox(height: 15),
                    Sans(
                        "Hello! I'm Claes Erik, Flutter, React Native and Android developer",
                        15),
                    Sans(
                        "I strive to ensure astounding performance with state of ",
                        15),
                    Sans("The art security for Android, IOS and Web ", 15),
                    SizedBox(height: 10),
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
                          child: Sans("Flutter", 15),
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
                          child: Sans("Firebase", 15),
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
                          child: Sans("Android", 15),
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
                          child: Sans("Web", 15),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          /**
           * ThirdSection About Me and Skills
           */
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/webL.png",
                            height: 200.0,
                            width: 200.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
