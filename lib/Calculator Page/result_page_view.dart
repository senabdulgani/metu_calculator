import 'package:flutter/material.dart';
import 'package:metu_calculator/Main%20Page/state_data.dart';
import 'package:provider/provider.dart';
import '../Footer Bar/footer_navigation_bar_view.dart';
import '../Constant/general_app_bar.dart';

class ResultPageView extends StatefulWidget {
  const ResultPageView({super.key});

  @override
  State<ResultPageView> createState() => _ResultPageViewState();
}

class _ResultPageViewState extends State<ResultPageView> {
  final String? title = 'result page';
  int currentPageIndex = 0;
  bool isAdvicePageActive = false;
  bool isFooterBarActive = true;
  double containerHeight = 0.0;

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.25, // Ekranın 1/4'ü kadar yükseklik
              child: const Center(
                child: Text('Buraya istediğiniz içeriği ekleyin'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double result = Provider.of<StateData>(context).result;
    // int currentPageIndex = Provider.of<StateData>(context).currentPageIndex;
    // final pageIndexModel = Provider.of<StateData>(context);

    return Scaffold(
      appBar: const MainAppBar(),
      body: Stack(children: [
        //darkOverlay,
        Visibility(
          visible: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Result Page ',
                  style: TextStyle(fontSize: 32),
                ),
                const Text(
                  'Your Average Grade: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  result.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    openBottomSheet(context);
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                          'assets/images/png-transparent-incandescent-light-bulb-emoji-lighting-infrared-flashlight-electronics-hand-color-thumbnail.png')),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    openBottomSheet(context);
                  },
                  child: const Text(
                    'Did you get any advice?',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const FooterNavigationBar(),
    );
  }
}

Widget darkOverlay = Positioned.fill(
  child: GestureDetector(
    onTap: () {
      // Arka plana tıklanınca modal ekranı kapatın
    },
    child: Container(),
  ),
);
