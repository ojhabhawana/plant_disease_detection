import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsSection extends StatelessWidget {
  InstructionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kMain.withValues(alpha: .4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
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
                    fontSize: 13.0,
                  ),
                )),
            ListTile(
              contentPadding: EdgeInsets.zero,
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
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
