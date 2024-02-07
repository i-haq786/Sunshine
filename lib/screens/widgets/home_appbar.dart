import 'dart:async';

import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color(0xFFF6EAFF)),
            // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time Left until reveal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF24003F),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                TimeLeft()
              ],
            ),
          ),
          CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(
              'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
            ),
          )
        ],
      ),
    );
  }
}

class TimeLeft extends StatefulWidget {
  const TimeLeft({Key? key}) : super(key: key);

  @override
  State<TimeLeft> createState() => _TimeLeftState();
}

String formatDuration(Duration d) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
  return "${d.inDays}days : ${d.inHours.remainder(24)}hrs: $twoDigitMinutes mins: $twoDigitSeconds s";
}

class _TimeLeftState extends State<TimeLeft> {
  late Timer _timer;
  final ValueNotifier<Duration> duration =
      ValueNotifier(DateTime.parse('2024-02-14').difference(DateTime.now()));

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      duration.value = DateTime.parse('2024-02-14').difference(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: duration,
      builder: (BuildContext context, Duration value, Widget? child) {
        return Text(
          formatDuration(value),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Color(0xFFC50A09)),
        );
      },
    );
  }
}
