import 'dart:async';

import 'package:cropssafe/components/btm_bar.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/screens/landingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSpiritedGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Center(
                  child: Image.asset(
                    "images/logo1.png",
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Crops Safe',
                        style: GoogleFonts.sail(
                            fontSize: 50, color: kDarkGreenColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  SpinKitCircle(
                    color: kDarkGreenColor,
                    size: 50.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
