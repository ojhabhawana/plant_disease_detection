import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpiritedGreen,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0)
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: "VT323",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
              AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20, left: 14, right: 14),
            child: Text(
              'Who We Are',
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Cropsafe is an innovative mobile application developed by Bhawana Ojha to assist farmers and agricultural professionals in identifying and preventing crop diseases using artificial intelligence. Our mission is to empower users with accurate and accessible plant health insights, helping to reduce crop losses and improve yields sustainably.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 40, left: 14, right: 14, bottom: 20),
            child: Text(
              'Our Vision',
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'We envision a world where technology bridges the gap between traditional farming and smart agriculture. With Cropsafe, we aim to bring advanced crop monitoring and disease detection tools directly to the hands of those who need them most.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 40, left: 14, right: 14, bottom: 20),
            child: Text(
              'Why Choose Cropsafe?',
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              '✓ Easy to use\n✓ Free to access\n✓ Powered by machine learning\n✓ Designed for farmers\n✓ Constant updates & improvements\n\nWe work continuously to improve the app by adding more crops, training smarter AI models, and ensuring reliable, real-time disease predictions.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 40, left: 14, right: 14, bottom: 20),
            child: Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'If you have any suggestions, questions, or want to collaborate, feel free to reach out to us at:\n\n📧 bhawanaojha@gmail.com',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            ),
          ),
        ],
      ),
    );
  }
}
