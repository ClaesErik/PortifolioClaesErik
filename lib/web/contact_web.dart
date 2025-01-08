import 'package:claes_erik/components.dart';
import 'package:claes_erik/res/globals.dart';
import 'package:flutter/material.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: WebDrawer(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 650.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 25.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                title: Row(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    TabsWeb(
                        title: "Home",
                        accentColor: Globals.accentColor,
                        route: '/'),
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
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SansBold("Contact Me", 40.0),
                SizedBox(height: 40.0),
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
                SizedBox(height: 20.0),
                TextForm(
                  accentColor: Globals.accentColor,
                  text: "Message",
                  containersWidth: widthDevice / 1.6,
                  hintext: "Please type your message",
                  maxLines: 10,
                ),
                SizedBox(height: 40.0),
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
          )),
    );
  }
}
