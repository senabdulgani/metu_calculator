import 'package:flutter/material.dart';

class footerNavigator extends StatelessWidget {

  final String? labelInfo;
  final IconData? iconType;
  final IconData? selectedIcon;
  final Function? passPage;
  footerNavigator(
      {super.key,
        @required this.labelInfo,
        @required this.iconType,
        this.selectedIcon,this.passPage});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(iconType),
      label: '$labelInfo',
    );
  }
}