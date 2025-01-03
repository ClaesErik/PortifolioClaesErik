import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final accentColor;
  const TabsWeb(this.title, this.accentColor, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
  final heading;
  final width;
  final hintext;
  final maxLines;

  const TextForm(
      {super.key,
      @required this.accentColor,
      @required this.heading,
      @required this.width,
      @required this.hintext,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(heading, 16.0),
        SizedBox(height: 5.0),
        SizedBox(
          width: width,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            maxLines: maxLines == null ? null : maxLines,
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

class AnimatedCardWeb extends StatefulWidget {
  final imagePath;
  final text;
  final subtext;
  final fit;
  final reverse;
  final accentColor;

  const AnimatedCardWeb({
    super.key,
    @required this.imagePath,
    @required this.text,
    this.subtext,
    this.fit,
    this.reverse,
    @required this.accentColor,
  });

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
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
                height: 200.0,
                width: 200.0,
                fit: widget.fit ?? null,
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
