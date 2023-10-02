import 'package:flutter/material.dart';
import 'package:metu_calculator/Main%20Page/home_page.dart';
import 'package:provider/provider.dart';
import '../timer_countdown_view.dart';
import '../Calculator Page/calculator_page.dart';
import '../Main Page/state_data.dart';
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
      backgroundColor: Colors.white,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MainMenuStarting(),
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
                    CalculatorPage(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            pageIndexModel.setCurrentPageIndex(1);
            break;
        }
      },
      indicatorColor: Colors.amber[200],
      selectedIndex: pageIndexModel.currentPageIndex,
      destinations: <Widget>[
        footerNavigator(
          labelInfo: 'home',
          iconType: pageIndexModel.currentPageIndex == 0
              ? Icons.home_outlined
              : Icons.home,
          passPage: () {
            pageIndexModel.setCurrentPageIndex(0);
          },
        ),
        footerNavigator(
          labelInfo: 'calculator',
          iconType: Icons.calculate,
          passPage: () {
            pageIndexModel.setCurrentPageIndex(1);
          },
        ),
      ],
    );
  }
}
