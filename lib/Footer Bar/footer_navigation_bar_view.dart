import 'package:flutter/material.dart';
import 'package:metu_calculator/home_page.dart';
import 'package:provider/provider.dart';
import '../Chat Page View/chat_page_view.dart';
import '../Calculator Page/calculator_page.dart';
import '../state_data.dart';
import 'footer_navigator.dart';

class FooterNavigationBar extends StatefulWidget {
  const FooterNavigationBar({super.key});

  @override
  State<FooterNavigationBar> createState() => _FooterNavigationBarState();
}

class _FooterNavigationBarState extends State<FooterNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final pageIndexModel = Provider.of<StateData>(context);

    return NavigationBar(

      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    TimerCountDown(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            pageIndexModel.setCurrentPageIndex(0);
            break;
          case 1:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MainMenuStarting(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            pageIndexModel.setCurrentPageIndex(1);
            break;
          case 2:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CalculatorPage(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            pageIndexModel.setCurrentPageIndex(2);
            break;
        }
      },
      indicatorColor: Colors.amber[100],
      selectedIndex: pageIndexModel.currentPageIndex,
      destinations: <Widget>[
        footerNavigator(
          labelInfo: 'chat',
          iconType: Icons.chat,
          passPage: () {
            pageIndexModel.setCurrentPageIndex(0);
          },
        ),
        footerNavigator(
          labelInfo: 'home',
          iconType: pageIndexModel.currentPageIndex == 1
              ? Icons.home_outlined
              : Icons.home,
          passPage: () {
            pageIndexModel.setCurrentPageIndex(1);
          },
        ),
        footerNavigator(
          labelInfo: 'calculator',
          iconType: Icons.calculate,
          passPage: () {
            pageIndexModel.setCurrentPageIndex(2);
          },
        ),
      ],
    );
  }
}
