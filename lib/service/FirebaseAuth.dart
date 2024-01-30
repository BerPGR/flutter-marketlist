import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> updateUserName() async {}

  Future<void> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseFirestore.instance.collection('users').add({
        'uid': _auth.currentUser?.uid,
        'name': name,
        'email': email,
        'creationDate': new DateTime.timestamp()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> singOut() async {
    await _auth.signOut();
  }
}
