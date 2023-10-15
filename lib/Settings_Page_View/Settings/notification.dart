import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

bool switchValueSound = true;
bool switchValueVibration = true;
bool notificationVibrationValue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Enable Reminder Notifications'),
              value: switchValueVibration, // You can manage the state of the switch here.
              onChanged: (bool value) {
                setState(() {
                  switchValueVibration =! switchValueVibration;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notification Sound'),
              value: switchValueSound,
              onChanged: (bool value) {
                setState(() {
                  switchValueSound =! switchValueSound;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notification Vibration'),
              value: notificationVibrationValue,
              onChanged: (bool value) {
                setState(() {
                  notificationVibrationValue =! notificationVibrationValue;
                });
              },
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: ElevatedButton(child: Text('Save'),
              onPressed: () {
                //Bilgileri shared preferences ile programa kaydet. 
                ///To-Do
              },
              ),
              ),
          ],
        ),
      ),
    );
  }
}
