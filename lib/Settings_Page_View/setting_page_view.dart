import 'package:flutter/material.dart';
import 'package:metu_calculator/Profile/profile_page_view.dart';
import 'package:metu_calculator/Settings_Page_View/Settings/notification.dart';
import 'package:metu_calculator/Settings_Page_View/language_view.dart';
import 'package:metu_calculator/Settings_Page_View/login_page_view.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: ListTile(
                title: const Text('Profile'),
                trailing: const Icon(Icons.arrow_forward_sharp),
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      //eğer formda sorun yoksa
                      return const ProfilePageView();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                    },
                  ));
                },
              ),
            ),
          ),
          _buildSettingsItem("Theme", onTap: () {}),
          _buildSettingsItem(
            "Notifications",
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
          _buildSettingsItem(
            "Language",
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return LanguagePageView();
                  },
                ),
              );
            },
          ),
          _buildSettingsItem(
            "Log-in",
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return LoginPageView();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingsItem(String title, {required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_sharp), // Right arrow icon
      ),
    ),
  );
}
