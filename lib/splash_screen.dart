import 'package:flutter/material.dart';
import 'package:metu_calculator/Main%20Page/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    navigatetohome();
  }


  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainMenuStarting(
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/metu_calculator mobil app.png',
                height: 300.0,
                width: 300.0,
              ),
              SizedBox(height: 16.0),
              CircularProgressIndicator(color: Colors.black,),
            ],
          ),
        ),
    );
  }
}
