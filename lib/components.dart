import 'package:claes_erik/utils/form_types.dart';
import 'package:claes_erik/utils/responsive_layout_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'res/globals.dart';

class TabsWeb extends StatefulWidget {
  final String title;
  final String route;
  final Color? accentColor;
  const TabsWeb({
    super.key,
    required this.title,
    this.accentColor,
    required this.route,
  });

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                    Shadow(
                      color: widget.accentColor ?? Colors.black,
                      offset: Offset(8, -8),
                    ),
                  ],
                  fontSize: 25.0,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.0,
                  decorationColor: widget.accentColor,
                )
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.title,
            style: GoogleFonts.oswald(
              color: Colors.black,
              fontSize: 23.0,
            ),
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final String text;
  final String route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final String? text;
  final String? subtext;
  final BoxFit? fit;
  final bool? reverse;
  final Color accentColor;
  final double? height;
  final double? width;
  final double paddingAll;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.subtext,
    this.fit,
    this.reverse,
    required this.accentColor,
    this.height,
    this.width,
    this.paddingAll = 15.0,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0.0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0.0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: widget.accentColor),
        ),
        shadowColor: widget.accentColor,
        child: Padding(
          padding: EdgeInsets.all(widget.paddingAll),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              SizedBox(height: 10.0),
              widget.text == null ? SizedBox() : SansBold(widget.text!, 15.0),
              widget.text == null
                  ? SizedBox()
                  : SansBold(widget.subtext!, 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class AccentBoxSkills extends StatelessWidget {
  final String text;
  const AccentBoxSkills({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Globals.accentColor, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Sans(text, 15.0),
    );
  }
}

class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    bool isMobileDevice = ResponsiveLayoutBuilder.isMobile(context);
    return Padding(
      padding: isMobileDevice
          ? const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0)
          : const EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0),
      child: Container(
        padding: EdgeInsets.all(isMobileDevice ? 10.0 : 20.0),
        decoration: BoxDecoration(
            border: Border.all(
          style: BorderStyle.solid,
          width: 1.0,
          color: Colors.black,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: "Who is Dash",
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              "Flutter has become my go-to framework for building high-quality, cross-platform applications. Its efficiency, flexibility, and performance have enabled me to bring my ideas to life with ease and speed. I'm excited to see how Flutter continues to evolve and empower developers to create amazing experiences for users across all platforms.",
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand == true ? null : 3,
              overflow:
                  expand == true ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class WebDrawer extends StatelessWidget {
  const WebDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  Globals.instagramIcon,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  width: 35.0,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse(Globals.instaURL));
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  Globals.githubIcon,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  width: 35.0,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse(Globals.githubURL));
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  Globals.linkedinIcon,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  width: 35.0,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse(Globals.linkedinURL));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

///Fonts widgets
class SansBold extends StatelessWidget {
  final String text;
  final double size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
      ),
      softWrap: true,
    );
  }
}

class TextForm extends StatelessWidget {
  final Color accentColor;
  final String text;
  final double containersWidth;
  final String hintext;
  final int? maxLines;
  final String? formType;

  const TextForm(
      {super.key,
      required this.accentColor,
      required this.text,
      required this.containersWidth,
      required this.hintext,
      this.maxLines,
      this.formType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        SizedBox(height: 5.0),
        SizedBox(
          width: containersWidth,
          child: TextFormField(
            validator: (text) {
              switch (formType) {
                case FormTypes.emailValue:
                  if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,3}$',
                          caseSensitive: false)
                      .hasMatch(text.toString())) {
                    return "email incorrect";
                  }

                case FormTypes.phoneNumberValue:
                  if (!RegExp(r'^(\d{2})\D*(\d{5}|\d{4})\D*(\d{4})$',
                          caseSensitive: false)
                      .hasMatch(text.toString())) {
                    return "phone incorrect";
                  }

                default:
                  if (!RegExp('[a-zA-Z0-9]', caseSensitive: false)
                      .hasMatch(text.toString())) {
                    return "incorrect";
                  }
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
              FilteringTextInputFormatter.allow(formType == "phoneNumber"
                  ? RegExp('[0-9]')
                  : RegExp('[\\s\\S]+')),
            ],
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: accentColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: accentColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintext,
              hintStyle:
                  GoogleFonts.poppins(fontSize: 14.0, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('accentColor', accentColor));
  }
}

class AbelCustom extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  const AbelCustom(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
