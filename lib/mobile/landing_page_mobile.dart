import 'package:claes_erik/components.dart';
import 'package:claes_erik/res/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/form_types.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
                child: Image.asset('assets/perfil-circle.png',
                    filterQuality: FilterQuality.high),
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
      body: ListView(
        children: [
          ///Intro First Section
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Globals.accentColor,
            child: CircleAvatar(
              radius: 110.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Globals.avatarCircleImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Globals.accentColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello, I am", 15.0),
                    ),
                    SansBold("Claes Erik", 40.0),
                    Sans("Flutter Developer", 20.0),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans("claeserikjr@gmail.com", 15.0),
                        Sans("+55 85 981134321", 15.0),
                        Sans("Praia Grande, São Paulo, Brasil", 15.0),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 90.0),

          ///About Me
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
          SizedBox(height: 60.0),

          ///What I do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I Do", 35.0),
              AnimatedCard(
                imagePath: Globals.webImagePath,
                text: "Web Development",
                subtext: "(React and Flutter)",
                accentColor: Globals.accentColor,
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: Globals.appExImagePath,
                text: "App Development",
                subtext: "(Android Native and Flutter)",
                fit: BoxFit.contain,
                reverse: true,
                accentColor: Globals.accentColor,
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: Globals.firebaseImagePath,
                text: "Back-end Development",
                subtext: "(Firebase and JavaSpring)",
                accentColor: Globals.accentColor,
                width: 300.0,
              ),
            ],
          ),
          SizedBox(height: 90.0),

          /// Contact Me
          Form(
            key: formKey,
            child: Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              alignment: WrapAlignment.center,
              children: [
                SansBold("Contact Me", 35.0),
                SizedBox(height: 15.0),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "First Name",
                  containersWidth: widthDevice / 1.4,
                  hintText: "Please type your first name",
                  controller: _firstNameController,
                  formType: FormTypes.firstName,
                ),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Last Name",
                  containersWidth: widthDevice / 1.4,
                  hintText: "Please type your last name",
                  controller: _lastNameController,
                ),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Email",
                  containersWidth: widthDevice / 1.4,
                  hintText: "Please type your email address",
                  formType: FormTypes.email,
                  controller: _emailController,
                ),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Phone number",
                  containersWidth: widthDevice / 1.4,
                  hintText: "Please type your phone number",
                  formType: FormTypes.phoneNumber,
                  controller: _phoneController,
                ),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Message",
                  containersWidth: widthDevice / 1.4,
                  hintText: "Please type your message",
                  maxLines: 10,
                  formType: FormTypes.message,
                  controller: _messageController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 90.0),
                  child: MaterialButton(
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
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
                    color: Globals.accentColor,
                    child: SansBold("Submit", 20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
