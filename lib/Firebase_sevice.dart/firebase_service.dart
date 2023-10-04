import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  //addData
  Future<void> addDataToFirestore() async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('feedback');
      String newData = '123123123!';
      await users.add({'fieldname': newData});
      debugPrint('Data added to Firestore: $newData');
    } catch (e) {
      debugPrint('Error adding data to Firestore: $e');
    }
  }

  //getData
  Future<void> getDataFromFirestore() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('collection_adi').doc('document_adi').get();
      debugPrint('Data from Firestore: ${documentSnapshot.data()}');
    } catch (e) {
      debugPrint('Error fetching data from Firestore: $e');
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
