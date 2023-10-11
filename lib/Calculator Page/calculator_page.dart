import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metu_calculator/Calculator%20Page/grades_store.dart';
import 'package:metu_calculator/Main%20Page/state_data.dart';
import 'package:provider/provider.dart';
import 'result_page_view.dart';
import '../Footer Bar/footer_navigation_bar_view.dart';
import '../Constant/general_app_bar.dart';

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

//focusnodleer ekle
FocusNode midterm1FocusNode = FocusNode();
FocusNode midterm2FocusNode = FocusNode();
FocusNode quiz1FocusNode = FocusNode();
FocusNode quiz2FocusNode = FocusNode();
FocusNode quiz3FocusNode = FocusNode();
FocusNode quiz4FocusNode = FocusNode();
FocusNode quiz5FocusNode = FocusNode();
FocusNode writing1FocusNode = FocusNode();
FocusNode writing2FocusNode = FocusNode();
FocusNode speakingFocusNode = FocusNode();
FocusNode instructorFocusNode = FocusNode();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

@override
class _CalculatorPage extends State<CalculatorPage> {
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

  @override
  void initState() {
    super.initState();
    UserGrades().veriOku();
  }
  // List<TextEditingController> gradeControllers =
  //     List.generate(11, (_) => TextEditingController());

  //ResultPageView resulPageInstance = new ResultPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                //Midterm ------------
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Midterm Notları', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                NotTextfield(
                  title: 'Midterm 1',
                  controller: midterm1Controller,
                  focusNode: midterm1FocusNode,
                  nextFocus: midterm2FocusNode,
                ),
                NotTextfield(
                  title: 'Midterm 2',
                  controller: midterm2Controller,
                  focusNode: midterm2FocusNode,
                  nextFocus: quiz1FocusNode,
                ),

                //Quiz ------------
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Quiz Notları', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                Column(
                  children: [
                    NotTextfield(
                      title: 'Quiz 1',
                      controller: quiz1Controller,
                      focusNode: quiz1FocusNode,
                      nextFocus: quiz2FocusNode,
                    ),
                    NotTextfield(
                      title: 'Quiz 2',
                      controller: quiz2Controller,
                      focusNode: quiz2FocusNode,
                      nextFocus: quiz3FocusNode,
                    ),
                    NotTextfield(
                      title: 'Quiz 3',
                      controller: quiz3Controller,
                      focusNode: quiz3FocusNode,
                      nextFocus: quiz4FocusNode,
                    ),
                    NotTextfield(
                      title: 'Quiz 4',
                      controller: quiz4Controller,
                      focusNode: quiz4FocusNode,
                      nextFocus: writing1FocusNode,
                    ),
                  ],
                ),

                //Writing ----------------
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Writing Notları', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                Column(
                  children: [
                    NotTextfield(
                      title: 'Writing 1',
                      controller: writing1Controller,
                      focusNode: writing1FocusNode,
                      nextFocus: writing2FocusNode,
                    ),
                    NotTextfield(
                      title: 'Writing 2',
                      controller: writing2Controller,
                      focusNode: writing2FocusNode,
                      nextFocus: speakingFocusNode,
                    ),
                  ],
                ),

                //Speaking ----------------
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Speaking Notları', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                NotTextfield(
                  title: 'Speaking',
                  controller: speakingController,
                  focusNode: speakingFocusNode,
                  nextFocus: instructorFocusNode,
                ),
                //Instructor ----------------
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Instructor Notları', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                NotTextfield(
                  title: 'Instructor',
                  controller: instructorController,
                  focusNode: instructorFocusNode,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    //eğer formda uyarı yoksa devam et
                    if (formKey.currentState!.validate()) {
                      calculateThem();
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          //eğer formda sorun yoksa
                          return const ResultPageView();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                        },
                      ));
                    }
                  },
                ),

                //Buttons________
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          resetBoard();
                          debugPrint('Bu buton calisiyor!');
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Exam grades have been saved.'),
                            ),
                          );
                          UserGrades().veriKaydet();
                        },
                        child: const Text('Save Grades'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<StateData>(
        builder: (context, pageIndexModel, child) {
          return FloatingActionButton(
            onPressed: () {
              //eğer formda bile uyarı varsa devam edemez
              if (formKey.currentState!.validate()) {
                calculateThem();
                pageIndexModel.setCurrentPageIndex(1);
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    //eğer formda sorun yoksa

                    return const ResultPageView();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child; // Animasyonları devre dışı bırakmak için child'ı döndürün
                  },
                ));
              }
            },
            child: const Icon(Icons.equalizer),
          );
        },
      ),
      bottomNavigationBar: const FooterNavigationBar(),
    );
  }
}

class NotTextfield extends StatelessWidget {
  const NotTextfield({
    super.key,
    required this.controller,
    required this.title,
    this.textInputAction = TextInputAction.next,
    this.padding = const EdgeInsets.only(bottom: 15),
    required this.focusNode,
    this.nextFocus,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  final String title;
  final TextInputAction textInputAction;
  final EdgeInsetsGeometry padding;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final Function? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();

    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        key: fieldKey,
        keyboardType: TextInputType.number,
        textInputAction: textInputAction,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ],
        onEditingComplete: () {
          fieldKey.currentState!.validate();
          if (onEditingComplete == null) {
            if (nextFocus == null) {
              if (textInputAction == TextInputAction.next) {
                FocusScope.of(context).nextFocus();
              } else if (textInputAction == TextInputAction.done) {
                FocusScope.of(context).unfocus();
              }
            } else if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              onEditingComplete!();
            }
          }
        },
        validator: (value) {
          if (value != null && double.tryParse(value) != null && double.parse(value) > 100) {
            return '100 den büyük olamaz';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          border: const OutlineInputBorder(),

          //FOCUS Style
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusColor: Colors.blue,
          //ERROR STYLE
        ),
      ),
    );
  }
}
