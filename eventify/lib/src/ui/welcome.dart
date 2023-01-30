import 'package:flutter/material.dart';
import 'package:eventify/src/ui/login.dart';
import 'package:eventify/src/ui/signup.dart';
import 'package:eventify/src/utils/sizes.dart';
import 'package:eventify/src/utils/text_strings.dart';
import 'package:eventify/src/utils/colors.dart';
import 'package:eventify/src/utils/image_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/styles.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(59.0, 150.0, 55.0, 0.0),
        color: MyColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                children:[
                  Image(
                    image: AssetImage(welcomeImage),
                    height: 160,
                  ),
                  Text(
                    appName,
                    style: Styles.nameStyles,
                  ),
                ]
            ),
            Text(
              welcomeTitle,
              style: Styles.welcomeTitleStyles,
              textAlign: TextAlign.center,
            ),
            Text(
              welcomeSubTitle,
              style: Styles.welcomeSubTitleStyles,
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: MyColors.lightBlueColor,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: MySize.buttonSize,
                  ),
                  child: Text(
                    signUp.toUpperCase(),
                    style: Styles.buttonStyles
                  ),
                ),
                const SizedBox(height: 25.0,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: MyColors.lightBlueColor,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: MySize.buttonSize,
                  ),
                  child: Text(
                    logIn.toUpperCase(),
                    style: Styles.buttonStyles
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}