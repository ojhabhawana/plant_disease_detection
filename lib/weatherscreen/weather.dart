import 'dart:convert';

import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/weatherscreen/planthealth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../diseases/AppleBlackRot.dart';
import '../diseases/AppleCedarRust.dart';
import '../diseases/AppleScab.dart';
import '../diseases/Healthy.dart';
import '../diseases/PotatoEarlyBlight.dart';
import '../diseases/PotatoLateBlight.dart';
import '../models/apimodel.dart';
import 'feeds_widget.dart';
import 'moisture.dart';

class wether extends StatefulWidget {
  wether({Key? key}) : super(key: key);

  @override
  State<wether> createState() => _wetherState();
}

class _wetherState extends State<wether> {
  ApiDataModel? dataModelApi;
  late Conditions temp = Conditions(), humid, moist;
  String head = "";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: kSpiritedGreen,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder(
            stream: Stream.periodic(Duration(seconds: 2))
                .asyncMap((i) => _fetchData()),
            // i is null here (check periodic docs)

            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('We got an Error ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      child: Theme(
                        data: ThemeData.light(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: CupertinoActivityIndicator(
                            animating: true,
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                  );

                case ConnectionState.none:
                  return Text('oops no data');

                case ConnectionState.done:
                  return Text('We are Done');
                default:
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MoistureView(
                          moist: moist,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            15,
                          ),
                          child: Text(
                            'Classified Disease',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 15.0,
                            padding: const EdgeInsets.only(right: 15.0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              FeedsWidget(
                                pimage: 'assets/black.jpg',
                                name: 'Apple Black Rot',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AppleBlack()),
                                  );
                                },
                              ),
                              FeedsWidget(
                                pimage: 'assets/cedar.jpg',
                                name: 'Apple Cedar Rust',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AppleCedarRust()),
                                  );
                                },
                              ),
                              FeedsWidget(
                                pimage: 'assets/scab.jpg',
                                name: 'Apple Scab',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AppleScab()),
                                  );
                                },
                              ),
                              FeedsWidget(
                                pimage: 'assets/health.png',
                                name: 'Healthy',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Healthy()),
                                  );
                                },
                              ),
                              FeedsWidget(
                                pimage: 'assets/16.jpg',
                                name: 'Potato Early Blight',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PotatoEarlyBlight()),
                                  );
                                },
                              ),
                              FeedsWidget(
                                pimage: 'assets/17.jpg',
                                name: 'Potato Late Blight',
                                onpressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PotatoLateBlight()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]);
              }
            },
          ),
        ),
      ),
    );
  }

  _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.thingspeak.com/channels/1490676/feeds.json?api_key=6CLVROP39ZFUDNV7'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
//print('response ${jsonDecode(response.body)}');
      dataModelApi = ApiDataModel.fromJson(json.decode(response.body));
      print(dataModelApi!.feeds![0].field1);
      print("Successfully fetched and parsed Sensor Data");

      // //Temperature
      // temp = Conditions();
      // temp.icon = 'assets/temperature.png';
      // temp.name = 'Temperature';
      // temp.value = 22.0;
      // temp.subText = 'Normal';
      // temp.color = '$normalTemp';
      // temp.subColor = '$normalText';
      // if (double.parse(dataModelApi!.feeds![0].field1!).toInt() >= 18 &&
      //     double.parse(dataModelApi!.feeds![0].field1!).toInt() <= 24) {
      // } else if (double.parse(dataModelApi!.feeds![0].field1!).toInt() > 24 &&
      //     double.parse(dataModelApi!.feeds![0].field1!).toInt() <= 35) {
      //   temp = Conditions();
      //   temp.icon = 'assets/temperature.png';
      //   temp.name = 'Temperature';
      //   temp.value = 20;
      //   temp.subText = 'Moderate';
      //   temp.color = '$moderateTemp';
      //   temp.subColor = '$moderateText';
      // } else if (double.parse(dataModelApi!.feeds![0].field1!).toInt() > 35) {
      //   temp = Conditions();
      //   temp.icon = 'assets/temperature.png';
      //   temp.name = 'Temperature';
      //   temp.value = '35';
      //   temp.subText = 'Critical';
      //   temp.color = '$highTemp';
      //   temp.subColor = '$highText';
      // }
      //
      // //Humidity
      // humid = Conditions();
      // humid.icon = 'assets/humidity.png';
      // humid.name = 'Humidity';
      // humid.value = '55';
      // humid.subText = 'Normal';
      // humid.color = '$lightBlueHumidity';
      // humid.subColor = '$normalText';
      // if (double.parse(dataModelApi!.feeds![0].field2!).toInt() >= 50 &&
      //     double.parse(dataModelApi!.feeds![0].field2!).toInt() <= 70) {
      //   humid = Conditions();
      //   humid.icon = 'assets/humidity.png';
      //   humid.name = 'Humidity';
      //   humid.value = '55';
      //   humid.subText = 'Normal';
      //   humid.color = '$lightBlueHumidity';
      //   humid.subColor = '$normalText';
      // } else if (double.parse(dataModelApi!.feeds![0].field2!).toInt() < 50) {
      //   humid = Conditions();
      //   humid.icon = 'assets/humidity.png';
      //   humid.name = 'Humidity';
      //   humid.value = '30';
      //   humid.subText = 'low';
      //   humid.color = '$lightBlueHumidity';
      //   humid.subColor = '$moderateText';
      // } else if (double.parse(dataModelApi!.feeds![0].field2!).toInt() > 70) {
      //   humid = Conditions();
      //   humid.icon = 'assets/humidity.png';
      //   humid.name = 'Humidity';
      //   humid.value = '80';
      //   humid.subText = 'High';
      //   humid.color = '$lightBlueHumidity';
      //   humid.subColor = '$highText';
      // }

      //Moisture

      if (double.parse(dataModelApi!.feeds![0].field3!).toInt() >= 70 &&
          double.parse(dataModelApi!.feeds![0].field3!).toInt() <= 100) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '60';
        moist.subText = 'No Irrigation Required';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${normalText}';
        head = moist.subText;
        print(head);
      } else if (double.parse(dataModelApi!.feeds![0].field3!).toInt() >= 30 &&
          double.parse(dataModelApi!.feeds![0].field3!).toInt() < 70) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '60';
        moist.subText = 'Irrigation to Be Applied';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${moderateText}';
        head = moist.subText;
        print(head);
      } else if (double.parse(dataModelApi!.feeds![0].field3!).toInt() < 30) {
        moist = Conditions();
        moist.icon = 'assets/drip.png';
        moist.name = 'Moisture';
        moist.value = '80';
        moist.subText = 'No Irrigation Required';
        moist.color = '${darkBlueMoisture}';
        moist.subColor = '${normalText}';
        head = moist.subText;
        print(head);
        // if (firsttime!) {
        //   print("Moisture: " + head);
        //   if (head == "Critically Low Soil Moisture") {
        //     NotificationService().instantNotification(
        //         head, "Please water the plants with more water", "alert");
        //   } else if (head == "Irrigation to Be Applied") {
        //     NotificationService()
        //         .instantNotification(head, "Please water the plants", "alert");
        //   } else if (head == "No Irrigation Required") {
        //     NotificationService()
        //         .instantNotification(head, "Your crop is healthy", "normal");
        //   }
        //   firsttime = false;
        // }
      }
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load Sensor Data');
    }
  }
}
