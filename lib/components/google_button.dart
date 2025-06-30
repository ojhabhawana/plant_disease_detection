import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/text_widget.dart';
import 'package:flutter/material.dart';

import '../consts/firebase_consts.dart';
import '../consts/global_methods.dart';
import 'btm_bar.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  Future<void> _googleSignIn(context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomBarScreen()));
    // final googleSignIn = GoogleSignIn();
    // final googleAccount = await googleSignIn.signIn();
    // if (googleAccount != null) {
    //   final googleAuth = await googleAccount.authentication;
    //   if (googleAuth.accessToken != null && googleAuth.idToken != null) {
    //     try {
    //       await authInstance.signInWithCredential(GoogleAuthProvider.credential(
    //           idToken: googleAuth.idToken,
    //           accessToken: googleAuth.accessToken));
    //       Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(
    //           builder: (context) => BottomBarScreen(),
    //         ),
    //       );
    //     } on FirebaseException catch (error) {
    //       GlobalMethods.errorDialog(
    //           subtitle: '${error.message}', context: context);
    //     } catch (error) {
    //       GlobalMethods.errorDialog(subtitle: '$error', context: context);
    //     } finally {}
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      color: kDarkGreenColor,
      child: InkWell(
        onTap: () {
          _googleSignIn(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/googleLogo.png',
              width: 20.0,
            ),
            const SizedBox(
              width: 8,
            ),
            TextWidget(
                text: 'Sign in with google', color: Colors.white, textSize: 16)
          ]),
        ),
      ),
    );
  }
}
