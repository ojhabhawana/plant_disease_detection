import 'dart:io';

import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSection extends StatelessWidget {
  final File? image;

  ImageSection({Key? key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 190.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kMain.withValues(alpha: .4),
        ),
        child: Center(
          child: image == null
              ? const Text(
                  'No image selected',
                  style: TextStyle(fontSize: 18),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    image!,
                    height: 190.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
