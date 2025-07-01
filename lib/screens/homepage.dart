import 'dart:convert';
import 'dart:io';

import 'package:cropssafe/consts/alertbox.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/greeting.dart';
import 'package:cropssafe/inner_screens/image.dart';
import 'package:cropssafe/inner_screens/instructions.dart';
import 'package:cropssafe/inner_screens/titlesection.dart';
import 'package:cropssafe/screens/predictionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../inner_screens/predictionbutton.dart';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);
  static const String id = 'LoginScreen';

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  File? _image;
  String? _response;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final img = File(image.path);

      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<void> sendImageToServer(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/predict'),
    );
    request.files.add(
      await http.MultipartFile.fromPath('file', image.path),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      showAlert("Image uploaded successfully");
      var responseBody = await response.stream.bytesToString();
      print(responseBody);
      var jsonResponse = json.decode(responseBody);

      String predictedClass = jsonResponse['class'];
      double confidence = jsonResponse['confidence'];
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PredictionPage(
              predictionclass: predictedClass,
              confidence: confidence,
              image: image.path,
            ),
          ));
      _response = null; // Reset the response when a new image is selected
      setState(() {
        _response = 'Prediction: $predictedClass\nConfidence: $confidence';
        print('Prediction: $predictedClass');
        print('Confidence: $confidence');
      });
    } else {
      showAlert('Image upload failed');
    }
  }

  void predictImage() {
    if (_image != null) {
      showAlert(' Image selected');
      sendImageToServer(_image!);
    } else {
      showAlert('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: kFoamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: SpeedDial(
        backgroundColor: kDarkGreenColor,
        icon: Icons.camera_alt,
        spacing: 10,
        children: [
          SpeedDialChild(
              child: FaIcon(
                FontAwesomeIcons.file,
                color: kWhite,
              ),
              label: "Choose image",
              backgroundColor: kMain,
              onTap: () {
                _pickImage(ImageSource.gallery);
              }
              // async {
              //   late double _confidence;
              //   await classifier.getDisease(ImageSource.gallery).then((value) {
              //     _disease = Disease(
              //         name: value![0]["label"],
              //         imagePath: classifier.imageFile.path);

              //     _confidence = value[0]['confidence'];
              //   });
              //   // Check confidence
              //   if (_confidence > 0.8) {
              //     // Set disease for Disease Service
              //     _diseaseService.setDiseaseValue(_disease);

              //     // Save disease
              //     _hiveService.addDisease(_disease);

              //     Navigator.restorablePushNamed(
              //       context,
              //       Suggestions.routeName,
              //     );
              //   } else {
              //     // Display unsure message

              //   }
              // },
              ),
          SpeedDialChild(
              child: FaIcon(
                FontAwesomeIcons.camera,
                color: kWhite,
              ),
              label: "Take photo",
              backgroundColor: kMain,
              onTap: () {
                _pickImage(ImageSource.camera);
              } //() async {
              //   late double _confidence;

              //   await classifier.getDisease(ImageSource.camera).then((value) {
              //     _disease = Disease(
              //         name: value![0]["label"],
              //         imagePath: classifier.imageFile.path);

              //     _confidence = value[0]['confidence'];
              //   });

              //   // Check confidence
              //   if (_confidence > 0.8) {
              //     // Set disease for Disease Service
              //     _diseaseService.setDiseaseValue(_disease);

              //     // Save disease
              //     _hiveService.addDisease(_disease);

              //     Navigator.restorablePushNamed(
              //       context,
              //       Suggestions.routeName,
              //     );
              //   } else {
              //     // Display unsure message

              //   }
              // },
              ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingSection(height: size.height * 0.18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instruction",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SFBold',
                      color: kDarkGreenColor),
                ),
                SizedBox(
                  height: 10,
                ),
                InstructionsSection(),
                SizedBox(
                  height: 20,
                ),
                ImageSection(
                  image: _image,
                ),
                SizedBox(
                  height: 20,
                ),
                PredictionButton(
                  onPressed: predictImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
