import 'package:cropssafe/screens/login_screen.dart';
import 'package:cropssafe/screens/signup_screen.dart';
import 'package:cropssafe/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //final Future<FirebaseApp> _firebaseinitialzationized = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(foregroundColor: Colors.white)),
        home: Splashscreen(),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          SignupScreen.id: (context) => const SignupScreen(),

          // ignore: equal_keys_in_map
          Home_page.id: (context) => Home_page()
        });
  }
}
