import 'package:flutter/material.dart';
import 'Footer Bar/footer_navigation_bar_view.dart';
import 'general_app_bar.dart';
import 'Drawer Component/my_drawer_dashboard.dart';
import 'Drawer Component/my_drawer_header.dart';

class MainMenuStarting extends StatelessWidget {
  const MainMenuStarting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(openDrawer: () {

      },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            MyDrawerHeader(), // Use your custom drawer header here
            MyDrawerDashboard(), // Use your custom drawer dashboard here
          ],
        ),
      ),
      body:Center(child: Text('Ana ekrana hoşgeldiniz.',style: TextStyle(fontSize: 24),)),
      bottomNavigationBar: FooterNavigationBar(),

    );
  }
}
