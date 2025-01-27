import 'package:claes_erik/components.dart';
import 'package:claes_erik/res/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/form_types.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
        onPressed: () async {
          await launchUrl(Uri.parse(url));
        },
        icon: SvgPicture.asset(
          imgPath,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          width: 35,
        ));
  }

  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: WebDrawer(),
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
                  filterQuality: FilterQuality.high,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
                    Sans(Globals.userIntro, 15.0),
                    Sans(Globals.userIntro2, 15.0),
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
                        imagePath: Globals.webImagePath,
                        text: "Web Development",
                        subtext: "(React and Flutter)",
                        accentColor: Globals.accentColor),
                    AnimatedCard(
                        imagePath: Globals.appExImagePath,
                        text: "App Development",
                        subtext: "(Android Native and Flutter)",
                        fit: BoxFit.contain,
                        reverse: true,
                        accentColor: Globals.accentColor),
                    AnimatedCard(
                        imagePath: Globals.firebaseImagePath,
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
            child: Form(
              key: formKey,
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
                            hintText: "Please enter your first name",
                            controller: _firstNameController,
                            formType: FormTypes.firstName,
                          ),
                          SizedBox(height: 15.0),
                          TextForm(
                            accentColor: Globals.accentColor,
                            text: "Email",
                            containersWidth: 350.0,
                            hintText: "Please enter your email address",
                            formType: FormTypes.email,
                            controller: _emailController,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(
                            accentColor: Globals.accentColor,
                            text: "Last Name",
                            containersWidth: 350.0,
                            hintText: "Please type you last name",
                            controller: _lastNameController,
                          ),
                          SizedBox(height: 15.0),
                          TextForm(
                            accentColor: Globals.accentColor,
                            text: "Phone Number",
                            containersWidth: 350.0,
                            hintText: "Please type your phone number",
                            formType: FormTypes.phoneNumber,
                            controller: _phoneController,
                          ),
                        ],
                      )
                    ],
                  ),
                  TextForm(
                    accentColor: Globals.accentColor,
                    text: "Message",
                    containersWidth: widthDevice / 1.6,
                    hintText: "Please type your message",
                    maxLines: 10,
                    controller: _messageController,
                    formType: FormTypes.message,
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
                    onPressed: () async {
                      logger.d(_firstNameController.text);
                      final addData = AddDataFirestore();
                      if (formKey.currentState!.validate()) {
                        await addData.addResponse(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneController.text,
                            _messageController.text);
                        formKey.currentState!.reset();
                        DialogError(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
