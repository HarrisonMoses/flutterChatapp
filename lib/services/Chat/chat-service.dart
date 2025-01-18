import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class chatservice {
  // initialise the firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String recieverID, message) async {
    //  get the current uer id
    final senderID = _auth.currentUser!.uid;
    final senderUserEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();

    // create a new message

    // craete a chat room ID for the two users(sorted to ensure uniqueness)

    // Add a new database to the database
  }

  // get message
}
