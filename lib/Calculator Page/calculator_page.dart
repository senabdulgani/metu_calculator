import 'package:flutter/material.dart';
import 'package:metu_calculator/state_data.dart';
import 'package:provider/provider.dart';
import 'package:switch_button/switch_button.dart';

import 'result_page_view.dart';
import '../Footer Bar/footer_navigation_bar_view.dart';
import '../App Bar/general_app_bar.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, this.title});

  final String? title;

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

TextEditingController midterm1Controller = TextEditingController(text: '0');
TextEditingController midterm2Controller = TextEditingController(text: '0');
TextEditingController quiz1Controller = TextEditingController(text: '0');
TextEditingController quiz2Controller = TextEditingController(text: '0');
TextEditingController quiz3Controller = TextEditingController(text: '0');
TextEditingController quiz4Controller = TextEditingController(text: '0');
TextEditingController quiz5Controller = TextEditingController(text: '0');
TextEditingController writing1Controller = TextEditingController(text: '0');
TextEditingController writing2Controller = TextEditingController(text: '0');
TextEditingController speakingController = TextEditingController(text: '0');
TextEditingController instructorController = TextEditingController(text: '0');

class _CalculatorPage extends State<CalculatorPage> {
  void calculateThem() {
    double midterm1 = double.parse(midterm1Controller.text);
    double midterm2 = double.parse(midterm2Controller.text);
    double quiz1 = double.parse(quiz1Controller.text);
    double quiz2 = double.parse(quiz2Controller.text);
    double quiz3 = double.parse(quiz3Controller.text);
    double quiz4 = double.parse(quiz4Controller.text);
    double quiz5 = double.parse(quiz5Controller.text);
    double writing1 = double.parse(writing1Controller.text);
    double writing2 = double.parse(writing2Controller.text);
    double speaking = double.parse(speakingController.text);
    double instructor = double.parse(instructorController.text);
    double result = 2.2;

    // Notların ağırlıklarını belirleyin (örneğin, quizlerin ağırlığı %30,
    // midterm'lerin ağırlığı %40, writing'in ağırlığı %10, speaking'in
    // ağırlığı %10 ve instructor notunun ağırlığı %10)

    double quizAgirlik = 0.3;
    double midtermAgirlik = 0.4;
    double writingAgirlik = 0.1;
    double speakingAgirlik = 0.1;
    double instructorAgirlik = 0.1;

    // Ortalama hesaplama
    result = (midterm1 + midterm2) / 2 * midtermAgirlik +
        (quiz1 + quiz2 + quiz3 + quiz4 + quiz5) / 5 * quizAgirlik +
        (writing1 + writing2) / 2 * writingAgirlik +
        speaking * speakingAgirlik +
        instructor * instructorAgirlik;

    Provider.of<StateData>(context, listen: false).updateResult(result);

    setState(() {});
  }

  //ResultPageView resulPageInstance = new ResultPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: MainAppBar(),

      body: CalculatorPageBodyComponent(),

      floatingActionButton: Consumer<StateData>(
        builder: (context, pageIndexModel, child) {
          return FloatingActionButton(
            onPressed: () {
              calculateThem();
              pageIndexModel.setCurrentPageIndex(2);
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ResultPageView(); // Geçiş yapılacak sayfayı buraya ekleyin
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                },
              ));
            },
            child: Icon(Icons.equalizer),
          );
        },
      ),

      bottomNavigationBar: FooterNavigationBar(),
    );
  }
}

class CalculatorPageBodyComponent extends StatefulWidget {
  const CalculatorPageBodyComponent({
    super.key,
  });

  @override
  State<CalculatorPageBodyComponent> createState() => _CalculatorPageBodyComponentState();
}

class _CalculatorPageBodyComponentState extends State<CalculatorPageBodyComponent> {
  @override
  Widget build(BuildContext context) {
    //bool isSaveModeOn = Provider.of<StateData>(context).isSaveModeOn;

    return Stack(
      alignment: Alignment.center,
      children: [

        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              // Not giriş alanları
              //2 piece Mid-Term grades
              TextField(
                controller: midterm1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Midterm 1 Notu',
                  hintText: '0-100 arası bir değer girin',
                ),
              ),
              TextField(
                controller: midterm2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Midterm 2 Notu',
                  hintText: '0-100 arası bir değer girin',
                ),
              ),
              // Quiz notları
              Text('Quiz Notları', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: quiz1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quiz 1',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: quiz2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quiz 2',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: quiz3Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quiz 3',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: quiz4Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quiz 4',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: quiz5Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quiz 5',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                ],
              ),
              // Writing notları
              Text('Writing Notları', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: writing1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Writing 1',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: writing2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Writing 2',
                        hintText: '0-100 arası bir değer girin',
                      ),
                    ),
                  ),
                ],
              ),
              //Speaking Grade
              TextField(
                controller: speakingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Speaking Notu',
                  hintText: '0-100 arası bir değer girin',
                ),
              ),
              //Instructor Grade
              TextField(
                controller: instructorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Instructor Notu',
                  hintText: '0-100 arası bir değer girin',
                ),
              ),
            ],
          ),
        ),

        //Logo image inside background.
        Center(
          child: IgnorePointer(
            ignoring: true,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/images/Logo_of_METU.svg.png',
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
        ),

      ],
    );
  }
}