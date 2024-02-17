import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreMethods {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>  get meetingDetails => _firebase
      .collection("users")
      .doc(_auth.currentUser!.uid)
      .collection("meetings")
      .snapshots();



  void addMeetingToHistory(String meetingName) {
    _firebase
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("meetings")
        .add({"meetingName": meetingName, "createdAt": DateTime.now()});
  }
}
