import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsSection extends SliverFixedExtentList {
  InstructionsSection(Size size, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: kSpiritedGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kMain,
                            child: Text(
                              '1',
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                          title: Text(
                            'Take/Select a photo of an affected plant by tapping the camera button below',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 15.0,
                            ),
                          )),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: kMain,
                          child: Text(
                            '2',
                            style: TextStyle(color: kWhite),
                          ),
                        ),
                        title: Text(
                          'Give it a short while before you can get a suggestion of the disease',
                          style: GoogleFonts.poppins(
                            color: kGreyColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
          itemExtent: size.height * 0.21,
        );
}
