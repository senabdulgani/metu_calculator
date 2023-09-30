import 'package:flutter/material.dart';
import 'package:metu_calculator/state_data.dart';
import 'package:provider/provider.dart';


class MyDrawerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final pageIndexModel = Provider.of<StateData>(context);

    return Column(
      children: [
        /*DrawerListTileComponent(iconText: 'Save your grades.',iconType: Icons.add_box_outlined,goTOPage: (){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CalculatorPageBodyComponent(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
          pageIndexModel.setCurrentPageIndex(2);
        },),*/
        DrawerListTileComponent(iconText: 'Account',iconType: Icons.login_outlined),
      ],
    );
  }
}

class DrawerListTileComponent extends StatelessWidget {

  DrawerListTileComponent({
    super.key,required this.iconType,required this.iconText,this.goTOPage
  });

  final IconData iconType;
  final String iconText;
  final Function? goTOPage;

  void goToPage(){

  }

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
