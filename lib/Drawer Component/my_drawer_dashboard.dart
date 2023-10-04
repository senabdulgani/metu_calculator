import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metu_calculator/Settings_Page_View/Settings/reminder.dart';
import 'package:metu_calculator/Settings_Page_View/login_page_view.dart';
import 'package:metu_calculator/Settings_Page_View/setting_page_view.dart';
import 'package:metu_calculator/Main%20Page/state_data.dart';
import 'package:metu_calculator/feedback_page_view.dart';
import 'package:provider/provider.dart';

class MyDrawerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final pageIndexModel = Provider.of<StateData>(context);
   
   
   
   Future<void> addDataToFirestore() async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('merahba');

    // Add a new document with a generated ID5
    await users.add({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      // Add other fields as needed
    });

    print('Data added to Firestore');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}

Future<void> fetchDataFromFirestore() async {
  try {
    QuerySnapshot merahbadanalinanveri = await FirebaseFirestore.instance.collection('merahba').get();

    // Loop through the documents and access data
    for (QueryDocumentSnapshot document in merahbadanalinanveri.docs) {
      print('User: ${document['name']}, Email: ${document['email']}');
      // Access other fields as needed
    }
  } catch (e) {
    print('Error fetching data from Firestore: $e');
  }
}


    return Column(
      children: [
        DrawerListTileComponent(
          iconText: 'Settings',
          iconType: Icons.settings,
          goTOPage: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SettingsPageView(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
            pageIndexModel.setCurrentPageIndex(0);
          },
        ),
        DrawerListTileComponent(
          iconText: 'Account',
          iconType: Icons.account_circle_outlined,
          goTOPage: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return LoginPageView();
                },
              ),
            );
          },
        ),
        DrawerListTileComponent(
          iconType: Icons.add_alert_rounded,
          iconText: 'Reminder',
          goTOPage: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) =>
                      ReminderPageView()),
                  transitionDuration: const Duration(seconds: 0)),
            );
          },
        ),
        DrawerListTileComponent(
          iconType: Icons.star,
          iconText: 'Feedback',
          goTOPage: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) =>
                      FeedbackPageView()),
                  transitionDuration: const Duration(seconds: 0)),
            );
          },
        ),
        DrawerListTileComponent(
          iconType: Icons.star,
          iconText: 'Feedback',
          goTOPage: () {
            addDataToFirestore;
          },
        ),
      ],
    );
  }
}

class DrawerListTileComponent extends StatelessWidget {
  const DrawerListTileComponent(
      {super.key,
      required this.iconType,
      required this.iconText,
      this.goTOPage});

  final IconData iconType;
  final String iconText;
  final Function? goTOPage;

  void goToPage() {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconType),
      title: Text('$iconText'),
      onTap: () {
        goTOPage!();
      },
    );
  }
}


