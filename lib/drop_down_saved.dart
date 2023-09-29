import 'package:flutter/material.dart';

class DropdownUsers extends StatefulWidget {
  @override
  _DropdownUsersState createState() => _DropdownUsersState();
}

class _DropdownUsersState extends State<DropdownUsers> {


  String selectedName = 'Verşan';

  List<String> names = [
    'Verşan',
    'Alptekin',
    'Selinay',
    'Muhammed',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton<String>(
          value: selectedName,
          onChanged: (String? newValue) {
            setState(() {
              selectedName = newValue!;
            });
          },
          items: names.map<DropdownMenuItem<String>>((String name) {
            return DropdownMenuItem<String>(
              value: name,
              child: Text(name),
            );
          }).toList(),
        ),
      ],
    );
  }
}