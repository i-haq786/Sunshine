import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sunshine/screens/onboarding_scrrens/date.dart';
import 'package:sunshine/screens/onboarding_scrrens/goals.dart';

import '../../dataProviders/app_data.dart';

class NameScreen extends StatefulWidget {
  static const String screenName = '/name';
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: 1,
                    count: 6,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFC80A09),
                        dotColor: Color(0xFFDECCCC)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'You are brave!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 26,
                              color: Color(0xFF24003F),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Thousands, if not millions just never met their valentine because they never took that first step! If your crush feels the same way about you, there is a match.',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF797A79)),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Container(
                          height: 41,
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 7),
                              hintText: 'Enter your crush name',
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7A10C3)),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7A10C3)),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7A10C3)),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 7),
                          decoration: BoxDecoration(
                              color: Color(0xFFE8FFE5),
                              boxShadow: [
                                // BoxShadow(
                                //     color: Colors.black.withOpacity(0.25),
                                //     offset: Offset(0, 4),
                                //     blurRadius: 4)
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Color(0xFF7A10C3),
                              ),
                              SizedBox(
                                width: 4.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Promise 1:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF00210B)),
                                  ),
                                  Text(
                                    'We won’t reveal your name unless their is a match.',
                                    style: TextStyle(
                                      color: Color(0xFF0B7601),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          child: NextButton(onPressed: () {
                            if (controller.text.isNotEmpty &&
                                controller.text.length > 3) {
                              Provider.of<AppData>(context, listen: false)
                                  .updateName(controller.text);
                              Navigator.pushNamed(
                                  context, DateScreen.screenName);
                            }
                          }),
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
