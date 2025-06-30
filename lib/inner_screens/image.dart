import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSection extends SliverFixedExtentList {
  ImageSection(image, {Key? key})
      : super(
            key: key,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return Center(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        height: 300.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kSpiritedGreen,
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
                                    height: 300.0,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      )),
                );
              },
              childCount: 1,
            ),
            itemExtent: 200);
}
