import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }

    try {
      if (_auth.currentUser?.displayName == null) {
        await _auth.currentUser?.updateDisplayName(name);
      }
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
