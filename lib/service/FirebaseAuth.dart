import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> registerWithEmailAndPassword(
      String email, String password, String name) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (_auth.currentUser!.displayName == null) {
      await _auth.currentUser!.updateDisplayName(name);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> singOut() async {
    await _auth.signOut();
  }
}
