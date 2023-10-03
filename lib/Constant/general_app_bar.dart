import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.openDrawer, // Çekmeyi açmak için bir işlev ekleyin
  });

  final VoidCallback? openDrawer; // Çekmeyi açmak için kullanılacak işlev

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.red[300],
      centerTitle: true,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Align children to the center
            children: [
              Image.asset(
                'assets/images/Logo_of_METU.svg.png',
                width: 30,
                height: 30,
              ),
              // Add spacing between the logo and text
              SizedBox(width: 5),
        
              Text('DBE Calculator.'),
            ],
          ),
        ),
      ),
    );
  }
}
