import 'package:flutter/material.dart';
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
            ? GoogleFonts.oswald(
                shadows: [
                  Shadow(
                    color: widget.accentColor,
                    offset: Offset(8, -8),
                  ),
                ],
                fontSize: 25.0,
                color: Colors.black,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
                decorationColor: widget.accentColor,
              )
            : GoogleFonts.oswald(color: Colors.black, fontSize: 23.0),
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
