import 'package:flutter/material.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  String name = 'John Doe';
  String email = 'john.doe@example.com';
  String password = '********';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/my_photo.jpg'),
                  ),
                ),
                ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    email,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(Icons.edit, color: Colors.grey),
                ),
                ListTile(
                  title: Text(
                    'Password: $password',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(Icons.edit, color: Colors.grey),
                ),
                ListTile(
                  title: TextFormField(),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to an edit profile page or show a modal for editing
                    // You can implement the edit functionality as needed
                    // For simplicity, I'm just changing the values here
                    setState(() {
                      name = 'New Name';
                      email = 'new.email@example.com';
                      password = 'new_password';
                    });
                  },
                  child: const Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
