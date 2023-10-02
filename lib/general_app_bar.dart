import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.openDrawer, // Çekmeyi açmak için bir işlev ekleyin
  });

  final VoidCallback? openDrawer; // Çekmeyi açmak için kullanılacak işlev

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/Logo_of_METU.svg.png',
              width: 30,
              height: 30,
            ),
            Text('DBE Calculator.'),
          ],
        ),
      ),
      );
  }
}
