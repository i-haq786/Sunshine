import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/dataProviders/app_data.dart';
import 'package:sunshine/screens/widgets/home_appbar.dart';

import '../services/notification_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!kIsWeb) {
      NotificationController.initializeContext(context);
      NotificationController.startListeningNotificationEvents();
      NotificationController.requestFirebaseToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppData>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double totalHeight = constraints.maxHeight;
          double firstContainerHeight = totalHeight * 2 / 5;
          double secondContainerHeight = totalHeight * 3 / 5;
          double overlayContainerHeight = 128;
          double overlayContainerTop =
              firstContainerHeight - overlayContainerHeight / 2;

          return StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (context, snapshot) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 20),
                                  child: HomeAppBar(),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text('')
                              ],
                            ),
                            width: double.infinity,
                            height: size.height * (2 / 5) - 73,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFFE0100),
                              Color(0xFFA70E0D),
                            ])),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              color: Color(0xFFEAECF2),
                            ))
                      ],
                    ),
                    Positioned(
                      top: overlayContainerTop,
                      left: size.width * 0.05,
                      child: Container(
                        height: overlayContainerHeight,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0xFFEAECF2),
                              Color(0xFFE3BEFD)
                            ])),
                      ),
                    ),
                  ],
                );
              });
        }),
      ),
    );
  }
}
