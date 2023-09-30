import 'package:flutter/material.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  get containerHeight => containerHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: containerHeight,
        color: Colors.black,
        child: const Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            // Your components here
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Text(
                'Your Bottom Container Content',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
