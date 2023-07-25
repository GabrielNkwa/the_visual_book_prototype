import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_visiual_book/screens/home_screen.dart';
import 'package:the_visiual_book/screens/signup_screen.dart';
import 'package:the_visiual_book/utils/color_utils.dart';

import '../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo1.png"),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Email", Icons.person_2_outlined,
                      false, _emailTextController),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true,
                      _passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      // print("Error ${error.toString()}");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                        content: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 70,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 48,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Oops Error!',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'This Username is not found!',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 25,
                                left: 20,
                                child: ClipRRect(
                                  child: Stack(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.red.shade200,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                )),
                            Positioned(
                                top: -20,
                                left: 5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 5,
                                        child: Icon(
                                          Icons.clear_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ));
                    });
                  }),
                  signUpOption()
                ],
              )),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an Account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
