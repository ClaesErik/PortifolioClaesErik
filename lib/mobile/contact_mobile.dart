import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../res/globals.dart';
import '../utils/form_types.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
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
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400.0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("assets/contact_image.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Form(
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
                      formType: FormTypes.firstName,
                      controller: _firstNameController,
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
                      hintText: "Please type our first name",
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
            )),
      ),
    );
  }
}
