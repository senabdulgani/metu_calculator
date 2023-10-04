import 'package:flutter/material.dart';

class ReminderPageView extends StatefulWidget {
  const ReminderPageView({super.key});

  @override
  _ReminderPageViewState createState() => _ReminderPageViewState();
}

class _ReminderPageViewState extends State<ReminderPageView> {
  // Store user-created reminders here.
  List<String> reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Custom Reminders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reminders[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Delete the reminder when the delete button is pressed.
                      setState(() {
                        reminders.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showAddReminderDialog(context);
              },
              child: const Text('Add Reminder'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    TextEditingController reminderController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    DateTime? selectedDate;
    // String errorMessage = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Custom Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: reminderController,
                decoration: const InputDecoration(labelText: 'Enter reminder text'),
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

                  if (selectedDate != null) {
                    dateController.text = '${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}';
                  }
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
                    // errorMessage = 'Both fields are required!';
                  });
                } else {
                  setState(() {
                    reminders.add('$reminderText\nDate: $dateText');
                    // errorMessage = ''; // Clear any previous error message.
                  });
                  Navigator.of(context).pop(); // Close the dialog.
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
