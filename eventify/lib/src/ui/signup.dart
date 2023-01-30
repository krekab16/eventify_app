import 'package:eventify/src/widgets/signbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eventify/src/utils/sizes.dart';
import 'package:eventify/src/utils/text_strings.dart';
import 'package:eventify/src/utils/colors.dart';

import '../utils/styles.dart';
import 'home.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String? answer;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _sucess;
  late String _userEmail;
  late String _nameUsername;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.lightBlueColor,
          title: Text(
            signUp,
            style: Styles.textStyles,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
              child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SignBox(
                                const Icon(
                                  Icons.account_circle,
                                  ),
                                fullName,
                                _nameController,
                                ),
                              const SizedBox(height: 15.0,),
                              //KELL-E USERNAME VAGY NE????????
                              SignBox(
                                const Icon(
                                  Icons.account_circle,
                                ),
                                userName,
                                _userNameController,
                              ),
                              const SizedBox(height: 15.0,),
                              SignBox(
                                const Icon(
                                  Icons.mail,
                                ),
                                email,
                                _emailController,
                              ),
                              const SizedBox(height: 15.0,),
                              SignBox(
                                const Icon(
                                  Icons.vpn_key,
                                ),
                                password,
                                _passwordController,
                              ),
                              const SizedBox(height: 20.0,),
                             Text(
                                 eventsChechBox,
                               style: const TextStyle(
                                 fontSize: 18,
                                 fontFamily: 'Roboto'
                               ),
                             ),
                              const SizedBox(height: 15.0,),
                             Row(
                               children: [
                                 Radio(
                                   value: "igen",
                                   groupValue: answer,
                                   onChanged: (value){
                                     setState(() {
                                       answer = value.toString();
                                     });
                                   },
                                 ),
                                 const Text(
                                   "Igen",
                                   style: Styles.textStyles,
                                 ),
                                 const SizedBox(width: 105.0,),
                                 Radio(
                                   value: "nem",
                                   groupValue: answer,
                                   onChanged: (value){
                                     setState(() {
                                       answer = value.toString();
                                     });
                                   },
                                 ),
                                 const Text(
                                   "Nem",
                                   style: Styles.textStyles,
                                 ),
                             ],
                             ),

                              const SizedBox(height: 75.0,),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (){
                                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text).then((value) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => Home()));
                                    });
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
                                    style: Styles.buttonStyles,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                    ),
                  ]
              ),
          ),

          ),
      );

  }
}