import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sunshine/dataProviders/app_data.dart';
import 'package:sunshine/screens/onboarding_scrrens/name.dart';

class Goals extends StatefulWidget {
  static const String screenName = '/goals';
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  List<String> options = [
    'BFF Date',
    'Find me a valentine date',
    'Fix a date with my college crush'
  ];
  List<int> selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
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
                    'My Goals:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF24003F),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Choose maximum 2 options:',
                    style: TextStyle(fontSize: 15, color: Color(0xFF797A79)),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.contains(0)
                                  ? selectedIndexes.remove(0)
                                  : selectedIndexes.length < 3
                                      ? selectedIndexes.add(0)
                                      : null;
                            });
                          },
                          child: Container(
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
                                child: selectedIndexes.contains(0)
                                    ? Stack(
                                        //mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              options[0],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFF000F39)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFA4F49D)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF0B7601),
                                                  size: 12,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Text(
                                        options[0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF797A79)),
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.contains(1)
                                  ? selectedIndexes.remove(1)
                                  : selectedIndexes.length < 3
                                      ? selectedIndexes.add(1)
                                      : null;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 13),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFF7A10C3), width: 1.0)),
                            child: Center(
                                child: selectedIndexes.contains(1)
                                    ? Stack(
                                        //mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              options[1],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFF000F39)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFA4F49D)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF0B7601),
                                                  size: 12,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Text(
                                        options[1],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF797A79)),
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.contains(2)
                                  ? selectedIndexes.remove(2)
                                  : selectedIndexes.length < 3
                                      ? selectedIndexes.add(2)
                                      : null;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 13),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(15),
                                    top: Radius.circular(5)),
                                border: Border.all(
                                    color: Color(0xFF7A10C3), width: 1.0)),
                            child: Center(
                                child: selectedIndexes.contains(2)
                                    ? Stack(
                                        //mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              options[2],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFF000F39)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFA4F49D)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFF0B7601),
                                                  size: 12,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Text(
                                        options[2],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF797A79)),
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
                          onPressed: () {
                            if (selectedIndexes.length > 2) {
                              Provider.of<AppData>(context, listen: false)
                                  .updateGoals(selectedIndexes
                                      .map((e) => options[e])
                                      .toList());
                              Navigator.pushNamed(
                                  context, NameScreen.screenName);
                            }
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

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gradient border
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                transform: GradientRotation(math.pi / 4),
                colors: [
                  Color(0xFFFEFEFF),
                  Color(0xFFC6CEDA),
                ],
              ),
            ),
          ),
          // Inner container
          Container(
            height: 65 - 0.32 * 2, // Subtract the border width
            width: 65 - 0.32 * 2, // Subtract the border width
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                transform: GradientRotation(math.pi / 4),
                colors: [
                  Color(0xFFEEF0F5),
                  Color(0xFFE6E9EF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-7.73, -7.73),
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 12.89,
                ),
                BoxShadow(
                  offset: Offset(6.44, 6.44),
                  color: Color(0xFFA6B4C8).withOpacity(0.7),
                  blurRadius: 12.89,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFC80A09),
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
