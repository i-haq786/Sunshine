import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sunshine/dataProviders/app_data.dart';
import 'package:sunshine/screens/home_screen.dart';
import 'package:sunshine/services/auth_service.dart';

import 'goals.dart';

class LoginScreen extends StatefulWidget {
  static const String screeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? user;
  bool loggedIn = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppData>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEAECF2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 0.47 * size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF9C2CEF),
                Color(0xFF9C2CEF).withOpacity(0.4),
                Color(0xFF9C2CEF).withOpacity(0.0)
              ])),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Image.asset(
                  'assets/pic1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color(0xFFEAECF2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 6,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFC80A09),
                        dotColor: Color(0xFFDECCCC)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF24003F),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'We need to verify that you are from the given college. We are only serving a few college. We want to set you up on a college date IRL.',
                    style: TextStyle(fontSize: 15, color: Color(0xFF797A79)),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 13),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                  bottom: Radius.circular(5)),
                              border: Border.all(
                                  color: Color(0xFF7A10C3), width: 1.0)),
                          child: Center(
                              child: DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                  child: Text(
                                      'SRM Institute of Science and Technology'))
                            ],
                            onChanged: (Object? value) {},
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            await AuthService.signInWithGoogle(context: context)
                                .then((value) {
                              if (value != null) {
                                loggedIn = true;
                                user = value;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 13),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFF7A10C3), width: 1.0)),
                            child: Center(
                                child: Text(
                              'Login With Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        // NeumorphicButton(width: 55, height: 55, child: Center(
                        //   child: Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: Color(0xFFC80A09),
                        //     size: 15,
                        //   ),
                        // ), backgroundColor: Color(0xFFEEF0F5), bottomRightShadowColor: bottomRightShadowColor, topLeftShadowColor: topLeftShadowColor, onTap: onTap)
                        NextButton(
                          onPressed: () async {
                            if (loggedIn && user != null) {
                              Provider.of<AppData>(context, listen: false)
                                  .updateUser(user!);
                              await FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user!.email)
                                  .set({
                                "name": user!.displayName,
                                "mailId": user!.email,
                                "dpUrl": user!.photoURL,
                                "date": {
                                  "time": provider.time?.toIso8601String(),
                                  "venue": provider.venue,
                                }
                              });
                              await FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user!.email)
                                  .collection('crush')
                                  .add(provider.crush!.toMap());
                              Navigator.pushNamed(
                                  context, HomeScreen.screenName);
                            }
                            //  Navigator.pushNamed(context, NameScreen.screenName);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
