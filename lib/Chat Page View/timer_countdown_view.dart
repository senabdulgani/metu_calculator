import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimerCountDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Define your exam day (adjust this date as needed)
    DateTime examDay = DateTime(2024, 6, 1, 9, 0);

    // Calculate the end time for the countdown by subtracting the time difference between now and the exam day from the exam day itself
    DateTime time = examDay.subtract(now.difference(examDay));

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Countdown'),
      ),
      body: Center(
        child: TimerCountdown(
          // Specify the countdown format (days, hours, minutes, and seconds)
          format: CountDownTimerFormat.daysHoursMinutesSeconds,

          // Set the end time for the countdown
          endTime: time,

          // Callback function to be called when the countdown reaches zero
          onEnd: () {
            print("Timer finished");
          },
        ),
      ),
    );
  }
}
