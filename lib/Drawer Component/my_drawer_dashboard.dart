import '../main.dart';
import 'package:flutter/material.dart';

class MyDrawerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Add navigation logic here
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
          },
        ),

        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('sign up'),
            onTap: (){
            }
        ),
        // Add more ListTiles as needed
      ],
    );
  }
}
