import 'package:flutter/material.dart';

class LanguagePageView extends StatefulWidget {
  const LanguagePageView({super.key});

  @override
  State<LanguagePageView> createState() => _LanguagePageViewState();
}

class _LanguagePageViewState extends State<LanguagePageView> {
  String selectedLanguage =
      'English'; // Store the selected language preference.

  List<String> languageOptions = [
    'English',
    'Spanish',
    'French',
    // Add more language options as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Your Preferred Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languageOptions.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedLanguage = value ?? 'English';
                });
              },
            ),
          ],
        ),
      ),

      floatingActionButton: TextButton(onPressed: () {
        
      },
      child: const Text('Save'),
            
      ),
    );
  }
}
