import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:metu_calculator/Firebase_sevice.dart/firebase_service.dart';

class TimerCountDown extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();

  TimerCountDown({super.key});

  @override
  Widget build(BuildContext context) {
    //Buraya "firebaseService.getExamDate();" eklenecek. tarih buradan alınacak
    DateTime examDay = DateTime(2024, 6, 1, 9, 0);

    // Calculate the end time for the countdown by subtracting the time difference between now and the exam day from the exam day itself
    // DateTime time = examDay.subtract(now.difference(examDay));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "EPE'ye bu kadar kaldığını biliyor muydun?",
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 230, 94, 94),
          ),
          padding: const EdgeInsets.all(10),
          child: TimerCountdown(
            format: CountDownTimerFormat.daysHoursMinutesSeconds,
            endTime: examDay,
            onEnd: () {
              debugPrint("Timer finished...");
            },
            timeTextStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            colonsTextStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
