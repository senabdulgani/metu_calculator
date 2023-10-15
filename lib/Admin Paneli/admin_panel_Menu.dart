import 'package:flutter/material.dart';
import 'package:metu_calculator/Admin%20Paneli/yemek_menusu_page.dart';

class AdminPanelMenu extends StatefulWidget {
  const AdminPanelMenu({super.key});

  @override
  State<AdminPanelMenu> createState() => _AdminPanelMenuState();
}

void showAddReminderDialog(BuildContext context) {
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
              decoration: const InputDecoration(labelText: "ŞİFRE: 'METUCAL'"),
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
                  dateController.text =
                      '${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}';
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
              if (reminderController.text == 'METUCAL') {
                //VERİ TABANINA KAYDET
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Şifre geçerli. Veri Tabanına Kaydedildi.'),
                  ),
                );
              } else {
                //VERİ TABANINA KAYDET
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('ŞİFRE GEÇERSİZ, KAYDEDİLEMEDİX!')));
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

class _AdminPanelMenuState extends State<AdminPanelMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: const [Icon(Icons.exit_to_app)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const YemekMenusuPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                child: const Text('Yemek Menüsü gir.')),
            ElevatedButton(
                onPressed: () {
                  showAddReminderDialog(context);
                },
                child: const Text('Sinav Tarihi '))
          ],
        ),
      ),
    );
  }
}
