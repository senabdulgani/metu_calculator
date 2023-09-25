import 'package:flutter/material.dart';
import 'package:metu_calculator/Footer%20Bar/footer_navigation_bar_view.dart';
import 'package:metu_calculator/Footer%20Bar/footer_navigator.dart';
import 'package:metu_calculator/main.dart';

import '../general_app_bar.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Container(
          height:200,
          width: 300,
          color: Colors.green,
          child: Center(child: Text('Chat ekranına hoşgeldiniz.',style: TextStyle(fontSize: 24),)),
        ),
      ),
      bottomNavigationBar: FooterNavigationBar(),
    );
  }
}