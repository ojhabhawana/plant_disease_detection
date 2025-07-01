import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/screens/login_screen.dart';
import 'package:cropssafe/screens/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: kSpiritedGreen,
        bodyPadding: EdgeInsets.only(left: 10, right: 10, top: 80, bottom: 0),
        pages: [
          PageViewModel(
            titleWidget: Text(
              'Crops Safe',
              style: GoogleFonts.sahitya(fontSize: 40, color: kDarkGreenColor),
              textAlign: TextAlign.center,
            ),
            bodyWidget: Text(
              'An All-in-One App to help farmers and make farming a lot easier.',
              style: GoogleFonts.poppins(color: kGreyColor),
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'images/slide1.png',
              height: 200,
            ),
            decoration: PageDecoration(
                pageColor: kSpiritedGreen, imagePadding: EdgeInsets.zero),
          ),
          PageViewModel(
            titleWidget: Text(
              'Crops Safe',
              style: GoogleFonts.sahitya(fontSize: 40, color: kDarkGreenColor),
            ),
            bodyWidget: Text(
              'Detect defects in crops so necessary care can be taken.',
              style: GoogleFonts.poppins(color: kGreyColor),
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'images/slide2.png',
              height: 200,
            ),
            decoration: PageDecoration(pageColor: kSpiritedGreen),
          ),
          PageViewModel(
            titleWidget: Text(
              'Crops Safe',
              style: GoogleFonts.sahitya(fontSize: 40, color: kDarkGreenColor),
            ),
            bodyWidget: Text(
              'Smart Agriculture gives live crop condition updates.',
              style: GoogleFonts.poppins(color: kGreyColor),
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'images/slide3.png',
              height: 200,
            ),
            decoration: PageDecoration(pageColor: kSpiritedGreen),
          ),
        ],
        onDone: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen())),
        onSkip: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen())),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: GoogleFonts.sahitya(
              fontSize: 16,
              color: kDarkGreenColor,
              fontWeight: FontWeight.bold),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: kDarkGreenColor,
          size: 20,
        ),
        done: Text(
          "Login",
          style: GoogleFonts.sahitya(
              fontSize: 16,
              color: kDarkGreenColor,
              fontWeight: FontWeight.bold),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: kDarkGreenColor,
          color: Colors.white24,
          size: const Size(10.0, 10.0),
          activeSize: const Size(22.0, 10.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        dotsContainerDecorator: ShapeDecoration(
            color: kSpiritedGreen, shape: RoundedRectangleBorder()),
      ),
    );
  }
}
