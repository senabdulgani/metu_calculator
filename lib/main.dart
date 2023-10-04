import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metu_calculator/Chat%20Page%20View/timer_countdown_view.dart';
import 'package:metu_calculator/Firebase%20Docs/firebase_options.dart';
import 'package:metu_calculator/Main%20Page/home_page.dart';
import 'package:metu_calculator/splash_screen.dart';
import 'Main Page/state_data.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateData()),
        // Diğer Provider sınıflarını buraya ekleyebilirsin
      ],
      child: const MyApp(),
    ),
  );
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
        '/chatDisplay': (context) => TimerCountDown(),

      },
    );
  }
}

