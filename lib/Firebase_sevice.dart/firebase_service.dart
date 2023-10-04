import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  //addData
  Future<void> addFeedback(String feedbackText) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('feedback');

      await users.add({'fieldname': feedbackText});
    } catch (e) {
      debugPrint('Error adding data to Firestore: $e');
    }
  }

  //getData
  Future<String> getExamDate() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('examDate').doc('date').get();

      debugPrint('gelen data: ${documentSnapshot.data()}');

      return documentSnapshot.data().toString();
    } catch (e) {
      debugPrint('HATA!: $e');
      //null
      return "Veri hatası";
    }
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();

      // Loop through the documents and access data
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        debugPrint('User: ${document['name']}, Email: ${document['email']}');
        // Access other fields as needed
      }
    } catch (e) {
      debugPrint('Error fetching data from Firestore: $e');
    }
  }
}
