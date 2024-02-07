import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/dataProviders/app_data.dart';
import 'package:sunshine/models/usermodel.dart';
import 'package:sunshine/screens/home_screen.dart';
import 'package:sunshine/screens/onboarding_scrrens/goals.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  setUpVars() async {
    if (FirebaseAuth.instance.currentUser != null) {
      User user = FirebaseAuth.instance.currentUser!;
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get()
          .then((value) async {
        UserModel userModel = UserModel.fromMap(value.data());
        Provider.of<AppData>(context, listen: false).updateUserModel(userModel);
        Navigator.pushNamed(context, HomeScreen.screenName);
      });
    } else {
      Navigator.pushNamed(context, Goals.screenName);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 0), () {
      setUpVars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Sunshine",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    // Text("Online Store \nFor Everyone",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 18.0,
                    //         fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
