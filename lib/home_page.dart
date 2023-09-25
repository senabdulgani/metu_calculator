import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Footer Bar/footer_navigation_bar_view.dart';
import 'App Bar/general_app_bar.dart';
import 'Drawer Component/my_drawer_dashboard.dart';
import 'Drawer Component/my_drawer_header.dart';

class MainMenuStarting extends StatefulWidget {
  const MainMenuStarting({super.key});

  @override
  State<MainMenuStarting> createState() => _MainMenuStartingState();
}

class _MainMenuStartingState extends State<MainMenuStarting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: Drawer(
        child: Column(
          //padding: EdgeInsets.zero,
          children: [
            MyDrawerHeader(), // Use your custom drawer header here
            MyDrawerDashboard(), // Use your custom drawer dashboard here
          ],

        ),
      ),
      bottomNavigationBar: FooterNavigationBar(),

    );
  }
}
