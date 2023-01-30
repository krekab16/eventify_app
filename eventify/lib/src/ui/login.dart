import 'package:flutter/material.dart';
import 'package:eventify/src/utils/sizes.dart';
import 'package:eventify/src/utils/text_strings.dart';
import 'package:eventify/src/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/styles.dart';
import 'home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  bool? check = true;

  //--Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //--Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //--Validator
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /* late bool _sucess;
  late String _userEmail;

  void _login() async {
    final User? user = (
        await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
    ).user;

    if(user != null) {
      setState(() {
        _sucess = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _sucess = false;
      });
    }
  }
*/

  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) =>
  //     {
  //       Fluttertoast.showToast(msg: "Okés"),
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const Home())),
  //     }).catchError((e) {
  //       Fluttertoast.showToast(msg: e!.messege);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightBlueColor,
        title: Text(
          logIn,
          style: Styles.textStyles,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kérem adja meg az email címét";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return "Kérem adjon meg egy helyes email címet";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _emailController.text = value!;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        label: Text(
                          email,
                          style: const TextStyle(
                            color: Color(0xFF787878),
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(color: MyColors.textColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.5, color: MyColors.textColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("A bejelentkezéshez jelszó szükséges");
                        }
                        if (value.length < 6) {
                          return ("A jelszónak legalább 6 karakterből kell állnia");
                        }
                      },
                      onSaved: (value) {
                        _emailController.text = value!;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        label: Text(
                          password,
                          style: const TextStyle(
                            color: Color(0xFF787878),
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(color: MyColors.textColor),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.5, color: MyColors.textColor),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: check, //set variable for value
                          onChanged: (bool? value) {
                            setState(() {
                              check = value;
                            });
                          },
                        ),
                        Text(
                          rememberMe,
                          style: Styles.textStyles,
                        ),
                        const SizedBox(
                          width: 35.0,
                        ),
                        Text(
                          forgetPassword,
                          style: const TextStyle(
                            color: Color(0xFF787878),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 280.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => Home()))
                                .catchError((e) => print(e));
                          });
                          /* _login();
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Home()));*/
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: MyColors.lightBlueColor,
                          padding: const EdgeInsets.all(20.0),
                          fixedSize: MySize.buttonSize,
                        ),
                        child: Text(logIn.toUpperCase(),
                            style: Styles.buttonStyles),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
