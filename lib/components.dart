import 'package:claes_erik/formTypes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globals.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  final accentColor;
  const TabsWeb({
    super.key,
    this.title,
    this.accentColor,
    this.route,
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
          print("Entered");
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
          print("Exit");
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                    Shadow(
                      color: widget.accentColor,
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
  final text;
  final route;
  const TabsMobile({super.key, @required this.text, @required this.route});

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

class SansBold extends StatelessWidget {
  final text;
  final size;
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
  final text;
  final size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final accentColor;
  final text;
  final containersWidth;
  final hintext;
  final maxLines;
  final formType;

  const TextForm(
      {super.key,
      @required this.accentColor,
      @required this.text,
      @required this.containersWidth,
      @required this.hintext,
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

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final subtext;
  final fit;
  final reverse;
  final accentColor;
  final height;
  final width;

  const AnimatedCard({
    super.key,
    @required this.imagePath,
    @required this.text,
    this.subtext,
    this.fit,
    this.reverse,
    @required this.accentColor,
    this.height,
    this.width,
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
          padding: const EdgeInsets.all(15.0),
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
              SansBold(widget.text, 15.0),
              SansBold(widget.subtext, 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

///some small components
class AccentBoxSkills extends StatelessWidget {
  final text;
  const AccentBoxSkills({super.key, @required this.text});

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
