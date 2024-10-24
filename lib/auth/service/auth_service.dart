import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  static Future<void> registerUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future logout() async {
    await auth.signOut();
  }
}
