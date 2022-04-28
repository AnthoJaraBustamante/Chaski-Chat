import 'package:animate_do/animate_do.dart';
import 'package:chat_take_home_test/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoChaski extends StatelessWidget {
  const LogoChaski({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LogoWidget(),
            SizedBox(height: 20),
            TitleLogo(),
          ],
        ),
      ),
    );
  }
}

class TitleLogo extends StatelessWidget {
  const TitleLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo_title',
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Text(
          'Chaski Chat',
          style: GoogleFonts.lusitana(
            color: ColorTheme.light.withOpacity(0.89),
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            // shadows: [
            //   Shadow(
            //     color: Colors.black.withOpacity(0.8),
            //     blurRadius: 10,
            //     offset: const Offset(-5, -0.2),
            //   ),
            // ],
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image.asset(
        'assets/chaski-mini.png',
        height: 200,
        width: 200,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
