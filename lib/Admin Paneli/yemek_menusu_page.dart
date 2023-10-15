import 'package:flutter/material.dart';


class YemekMenusuPage extends StatefulWidget {
  const YemekMenusuPage({super.key});

  @override
  State<YemekMenusuPage> createState() => _YemekMenusuPageState();
}

class _YemekMenusuPageState extends State<YemekMenusuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        actions: const [
          Icon(Icons.exit_to_app),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  MealComponentGroup(),
                  MealComponentGroup(),
                  MealComponentGroup(),
                  MealComponentGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealComponentGroup extends StatelessWidget {
  const MealComponentGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ayin 1. günü yemek menüsü.'),
        TextFormField(),
        TextFormField(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class MealListComponent extends StatelessWidget {
  MealListComponent({
    super.key,required this.controller1a});

    TextEditingController controller1a;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller1a,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelStyle: TextStyle(
            color: Colors.black, fontSize: 15, 
            fontWeight: FontWeight.w500),
            border: OutlineInputBorder(),
            //Focus Style
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            focusColor: Colors.blue,
            //Error Style
          ),
        ),
      ],
    );
  }
}

