import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<void> addDataToFirestore() async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('collection_adi');
      String newData = 'Hello, Firestore!';
      await users.add({'fieldname': newData});
      print('Data added to Firestore: $newData');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }
}

Future<void> fetchDataFromFirestore() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').get();

    // Loop through the documents and access data
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      print('User: ${document['name']}, Email: ${document['email']}');
      // Access other fields as needed
    }
  } catch (e) {
    print('Error fetching data from Firestore: $e');
  }
}

