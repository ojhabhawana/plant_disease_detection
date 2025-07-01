import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingSection extends StatelessWidget {
  final double height;

  const GreetingSection({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular((0.079 * height)),
                bottomRight: Radius.circular((0.079 * height))),
            child: Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular((0.079 * height)),
                  bottomRight: Radius.circular((0.079 * height))),
              color: Colors.black54,
            ),
            height: 180,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/logo1.png',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Crops Safe',
                        style: GoogleFonts.sahitya(
                            fontSize: 35, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [kFoamColor, Colors.white])),
            ),
          )
        ],
      ),
    );
  }
}
