import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
              title: const Text('Enable Notifications'),
              value: true, // You can manage the state of the switch here.
              onChanged: (bool value) {
                // Handle the switch state change here.
              },
            ),
            ListTile(
              title: const Text('Notification Sound'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to a page to select notification sound.
              },
            ),
            ListTile(
              title: const Text('Notification Vibration'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to a page to configure notification vibration.
              },
            ),
          ],
        ),
      ),
    );
  }
}
