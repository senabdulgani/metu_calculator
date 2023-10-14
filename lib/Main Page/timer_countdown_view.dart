import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';


class TimerCountDown extends StatefulWidget {
  TimerCountDown({Key? key}) : super(key: key);

  @override
  _TimerCountDownState createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {

  // List of reminders fetched from Firebase
  DateTime examDay = DateTime(2024, 6, 1, 9, 0);
  DateTime reminder1 = DateTime(2024,1,5,23);
  
  int counter = 0;

  void increaseCounter() {    
      counter++;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> counterWidgets = List.generate(counter, (index) {
      return CounterForReminders(examDay: examDay);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        CounterForReminders(examDay: examDay),
        SizedBox(height: 20,),
        Column(
          children: counterWidgets,
        ),
        //This section will destroy.

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            increaseCounter();
            // Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         AdminPanelMenu(),
            //     transitionDuration: Duration(seconds: 0),
            //   ),
            // );
          },
          child: const Text('Admin Panel Giriş'),
        ),
        ],
    );
  }
}

class CounterForReminders extends StatelessWidget {
  const CounterForReminders({
    super.key,
    required this.examDay,
  });

  final DateTime examDay;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}