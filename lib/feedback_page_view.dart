import 'package:flutter/material.dart';

class FeedbackPageView extends StatefulWidget {
  @override
  State<FeedbackPageView> createState() => _FeedbackPageViewState();
}

class _FeedbackPageViewState extends State<FeedbackPageView> {
  String feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Arka plan rengi (kırmızı)

      body: Center(
        child: Container(
          width: 320, // Container'ın genişliği
          height: 500,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'METU calculator hakkında ne düşünüyorsun?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                //textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center, // Center the TextField vertically
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border rengi
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 300.0, // Set a maximum height for the TextField
                  ),
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: 1000, // Null allows for unlimited lines
                      onChanged: (value) {
                        setState(() {
                          feedback = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Tavsiyenizi yazin',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Geri bildirim gönderme işlemini burada gerçekleştirin
                    // Örneğin, bir API çağrısı yapabilirsiniz
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Geri bildiriminiz gönderildi!'),
                      ),
                    );
                  },
                  child: const Text('Geri Bildirimi Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
