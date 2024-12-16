import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the current user
  User? get currentUser => _auth.currentUser;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // save user name
    await authResult.user!.updateDisplayName(name);

    return authResult.user;
  }

  // verify email
  Future<void> verifyEmail() async {
    await currentUser!.sendEmailVerification();
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential authResult = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return authResult.user;
  }

  // Send reset password email
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
