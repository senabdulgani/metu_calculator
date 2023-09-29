import 'package:flutter/material.dart';
import 'package:metu_calculator/state_data.dart';
import 'package:provider/provider.dart';
import '../drop_down_saved.dart';
import 'result_page_view.dart';
import '../Footer Bar/footer_navigation_bar_view.dart';
import '../general_app_bar.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, this.title});

  final String? title;

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

TextEditingController midterm1Controller = TextEditingController();
TextEditingController midterm2Controller = TextEditingController();
TextEditingController quiz1Controller = TextEditingController();
TextEditingController quiz2Controller = TextEditingController();
TextEditingController quiz3Controller = TextEditingController();
TextEditingController quiz4Controller = TextEditingController();
TextEditingController quiz5Controller = TextEditingController();
TextEditingController writing1Controller = TextEditingController();
TextEditingController writing2Controller = TextEditingController();
TextEditingController speakingController = TextEditingController();
TextEditingController instructorController = TextEditingController();

@override
class _CalculatorPage extends State<CalculatorPage> {

  //create result variable for write other page.
  double result = 0.0;

  /*Future<void> saveExamGrades() async {
    final prefs = await SharedPreferences.getInstance();

    // Save the exam grades to SharedPreferences
    prefs.setDouble('midterm1', midterm1);
    prefs.setDouble('midterm2', midterm2);
    prefs.setDouble('quiz1', quiz1);
    prefs.setDouble('quiz2', quiz2);
    prefs.setDouble('quiz3', quiz3);
    prefs.setDouble('quiz4', quiz4);
    prefs.setDouble('quiz5', quiz5);
    prefs.setDouble('writing1', writing1);
    prefs.setDouble('writing2', writing2);
    prefs.setDouble('speaking', speaking);
    prefs.setDouble('instructor', instructor);
  }*/

  void resetBoard() {
  midterm1Controller.clear();
  midterm2Controller.clear();
  quiz1Controller.clear();
  quiz2Controller.clear();
  quiz3Controller.clear();
  quiz4Controller.clear();
  quiz5Controller.clear();
  writing1Controller.clear();
  writing2Controller.clear();
  speakingController.clear();
  instructorController.clear();
  }

  void calculateThem() {
    double? midterm1 = double.tryParse(midterm1Controller.text);
    double? midterm2 = double.tryParse(midterm2Controller.text);
    double? quiz1 = double.tryParse(quiz1Controller.text);
    double? quiz2 = double.tryParse(quiz2Controller.text);
    double? quiz3 = double.tryParse(quiz3Controller.text);
    double? quiz4 = double.tryParse(quiz4Controller.text);
    double? quiz5 = double.tryParse(quiz5Controller.text);
    double? writing1 = double.tryParse(writing1Controller.text);
    double? writing2 = double.tryParse(writing2Controller.text);
    double? speaking = double.tryParse(speakingController.text);
    double? instructor = double.tryParse(instructorController.text);

    // Notların ağırlıklarını belirleyin (örneğin, quizlerin ağırlığı %30, midterm'lerin ağırlığı %40, writing'in ağırlığı %10, speaking'in ağırlığı %10 ve instructor notunun ağırlığı %10)
    double quizAgirlik = 0.3;
    double midtermAgirlik = 0.4;
    double writingAgirlik = 0.1;
    double speakingAgirlik = 0.1;
    double instructorAgirlik = 0.1;

    // Sıfır veya boş olmayan notları hesaplamaya dahil et
    double totalScore = 0;
    double totalWeight = 0;

    if (midterm1 != null) {
      totalScore += midterm1 * midtermAgirlik;
      totalWeight += midtermAgirlik;
    }
    if (midterm2 != null) {
      totalScore += midterm2 * midtermAgirlik;
      totalWeight += midtermAgirlik;
    }
    if (quiz1 != null) {
      totalScore += quiz1 * quizAgirlik;
      totalWeight += quizAgirlik;
    }
    if (quiz2 != null) {
      totalScore += quiz2 * quizAgirlik;
      totalWeight += quizAgirlik;
    }
    if (quiz3 != null) {
      totalScore += quiz3 * quizAgirlik;
      totalWeight += quizAgirlik;
    }
    if (quiz4 != null) {
      totalScore += quiz4 * quizAgirlik;
      totalWeight += quizAgirlik;
    }
    if (quiz5 != null) {
      totalScore += quiz5 * quizAgirlik;
      totalWeight += quizAgirlik;
    }
    if (writing1 != null) {
      totalScore += writing1 * writingAgirlik;
      totalWeight += writingAgirlik;
    }
    if (writing2 != null) {
      totalScore += writing2 * writingAgirlik;
      totalWeight += writingAgirlik;
    }
    if (speaking != null) {
      totalScore += speaking * speakingAgirlik;
      totalWeight += speakingAgirlik;
    }
    if (instructor != null) {
      totalScore += instructor * instructorAgirlik;
      totalWeight += instructorAgirlik;
    }

    // Ortalama hesaplama
    double result = totalWeight > 0 ? totalScore / totalWeight : 0;

    Provider.of<StateData>(context, listen: false).updateResult(result);

    setState(() {});
  }




  //ResultPageView resulPageInstance = new ResultPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: MainAppBar(),

      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // Not giriş alanları
              children: [
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 12,top: 16,bottom: 8), // Adjust the padding as needed
                    child: ElevatedButton(
                      onPressed: () {
                        resetBoard();
                        print('Bu buton çalışıyor!');
                      },
                      child: Text('Reset'),
                    ),
                  ),
                ),
              ),



              Flexible(
                flex: 1,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8,top: 16,bottom: 8),
                      child: DropdownUsers(),
                    )),
              ),



              Flexible(
                flex:1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(right: 8,top: 16,bottom: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Exam grades have been saved.'),
                          ),
                        );
                        //saveExamGrades();
                      },
                      child: Text('Save Grades'),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
      floatingActionButton: Consumer<StateData>(
        builder: (context, pageIndexModel, child) {
          return FloatingActionButton(
            onPressed: () {
              calculateThem();
              pageIndexModel.setCurrentPageIndex(2);
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ResultPageView();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                },
              ));
            },
            child: Icon(Icons.equalizer),
          );
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: FooterNavigationBar(),
    );
  }
}
