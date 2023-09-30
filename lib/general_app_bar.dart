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
      title: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fucking Calculator',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ],
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed: openDrawer, // Çekmeyi açmak için belirtilen işlevi çağırın
    );
  }
}
