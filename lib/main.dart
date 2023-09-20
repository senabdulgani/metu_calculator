import 'package:flutter/material.dart';
import 'package:metu_calculator/Chat%20Page%20View/chat_page_view.dart';
import 'package:metu_calculator/home_page.dart';

import 'splash_screen.dart';
import 'state_data.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(create:(BuildContext context){
    return StateData();
    },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      //home: Splash(),
      initialRoute: '/',

      routes: {
        '/': (context)=> Splash(),
        '/homePage': (context)=> MainMenuStarting(),
        '/chatDisplay': (context) => ChatPage(),

      },
    );
  }
}

