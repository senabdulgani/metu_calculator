import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  DateTime? selectedDate;
  TextEditingController reminderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    Future<void> _secilizaman() async {}

    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Admin Panel'),
          centerTitle: true,
        ),
        body: AlertDialog(
          title: const Text('Add Custom Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: reminderController,
                decoration:
                    const InputDecoration(labelText: 'Enter reminder text'),
              ),
              TextField(
                controller: dateController,
                readOnly: true, // Make the text field read-only.
                decoration: const InputDecoration(labelText: 'Select Date'),
                onTap: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 5),
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String reminderText = reminderController.text;
                String dateText = dateController.text;

                if (reminderText.isEmpty || dateText.isEmpty) {
                setState(() {
                  errorMessage = 'Both fields are required!';
                });
              } else {
                setState(() {
                  
                  errorMessage = ''; // Clear any previous error message.
                });
                Navigator.of(context).pop(); // Close the dialog.
              }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    ]);
  }
}
