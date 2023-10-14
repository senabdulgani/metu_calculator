import 'package:flutter/material.dart';
import 'package:metu_calculator/Settings_Page_View/setting_page_view.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String name = passwordController.text;
  late String email = emailController.text;
  String password = 'sifre';
  
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          width: 350,
          height: 750,
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
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () {
                      if (editMode == true) {
                        //Save modunda olduğu için bir uyarı çıksın.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:
                                  const Text("Don't forget your changes."),
                              content: const Text(
                                  'Your changes may not have been saved!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Discard'a tıklanırsa yapılacak işlemler
                                    // Örneğin değişiklikleri iptal etmek için gerekli kodlar buraya yazılabilir.
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Discard'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Cancel'a tıklanırsa yapılacak işlemler
                                    // Örneğin alert dialog'u kapatmak için gerekli kodlar buraya yazılabilir.
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            //eğer formda sorun yoksa
                            return const SettingsPageView();
                          },
                          transitionsBuilder: (context, animation,
                              secondaryAnimation, child) {
                            return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                          },
                        ));
                        print("Diğer sayfaya geçiş işlemi yapildi.");
                      }
                    },
                  ),
                  title: const Text(
                    'Hesabınız bulunmamaktadır!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  subtitle: Center(
                    child: Text(
                      'Hesabınız bulunmamaktadır!',
                      style: TextStyle(
                        fontSize: 18,
                        color: editMode == true ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit,
                        color: editMode == true ? Colors.grey : Colors.black),
                    onPressed: () {
                      setState(() {
                        editMode = true;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: editMode==true?true:false,
                  child: ListTile(
                    title: Center(
                      // Center horizontally
                      child: TextFormField(
                        controller: emailController,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    // Center horizontally
                    child: Text(
                      'Password: $password',
                      style: TextStyle(
                        fontSize: 18,
                        color: editMode == true ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit,
                        color: editMode == true ? Colors.grey : Colors.black),
                    onPressed: () {
                      setState(() {
                        editMode = true;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: editMode==true?true:false,
                  child: ListTile(
                    title: Center(
                      // Center horizontally
                      child: TextFormField(
                        controller: passwordController,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: editMode==true?true:false,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        editMode = false;
                      });
                      //Insert shared preferences for saving on user's device.
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
