import 'package:flutter/material.dart';
import 'package:metu_calculator/Settings_Page_View/setting_page_view.dart';


class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1.0, // Border width
        ),
      ),
    child: ListTile(
      title: Text(''),
      trailing: const Icon(Icons.arrow_forward_sharp), // Right arrow icon
      onTap: () {
        
      },
    ),
  );
  }
}