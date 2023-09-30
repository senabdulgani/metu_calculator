import 'package:shared_preferences/shared_preferences.dart';
import 'Calculator Page/calculator_page.dart';

class UserGrades {

  veriKaydet() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.setString("midterm1controller", midterm1Controller.text);
    //await prefs.setString("midterm2controller", midterm2Controller.text);
    // await prefs.setString("quiz1controller", quiz1Controller.text);
    // await prefs.setString("quiz2controller", quiz2Controller.text);
    // await prefs.setString("quiz3controller", quiz3Controller.text);
    // await prefs.setString("quiz4controller", quiz4Controller.text);
    // await prefs.setString("quiz5controller", quiz5Controller.text);
    // await prefs.setString("writing1controller", writing1Controller.text);
    // await prefs.setString("writing2controller", writing2Controller.text);
    // await prefs.setString("speakingcontroller", speakingController.text);
    // await prefs.setString("instructorcontroller", instructorController.text);
    
  }

  veriOku()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //midterm1Controller.text = prefs.getString("midterm1controller")!;
    String? mt2 = prefs.getString("midterm2controller");


  }
}
