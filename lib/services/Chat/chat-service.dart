import 'package:cloud_firestore/cloud_firestore.dart';

class chatservice{
  // initialise the firestore 
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream 
Stream<List<Map<String,dynamic>>> getUserStream(){
  return _firestore.collection('Users')
  .snapshots()
  .map((snapshot){
    return snapshot.docs
    .map((doc){
      return doc.data();
    }).toList();
    });
  }

  // send message

  // get message 

  
}