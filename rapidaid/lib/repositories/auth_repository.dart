import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp({
    required String username,
    String? email,
    String? phoneNumber,
    required String password,
    required String dateOfBirth,
  }) async {
    try {
      // Firebase Auth only supports email/password or phone authentication
      // For this example, we'll use email/password if provided, otherwise create custom auth
      UserCredential userCredential;

      if (email != null) {
        userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else if (phoneNumber != null) {
        // For phone auth in a real app, you would need to implement SMS verification
        // This is simplified for this example
        throw Exception(
          'Phone authentication requires SMS verification implementation',
        );
      } else {
        throw Exception('Either email or phone number is required');
      }

      // Store additional user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Sign out after registration so user needs to login
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('Registration failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> login({
    required String username,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      // Check if username is an email
      bool isEmail = username.contains('@');

      if (isEmail) {
        // Direct login with Firebase Auth
        await _firebaseAuth.signInWithEmailAndPassword(
          email: username,
          password: password,
        );
      } else {
        // Query Firestore to find the user by username
        final querySnapshot =
            await _firestore
                .collection('users')
                .where('username', isEqualTo: username)
                .limit(1)
                .get();

        if (querySnapshot.docs.isEmpty) {
          throw Exception('User not found');
        }

        final userData = querySnapshot.docs.first.data();
        final userEmail = userData['email'];

        if (userEmail == null) {
          throw Exception('Cannot login with username, email not found');
        }

        // Login with the retrieved email
        await _firebaseAuth.signInWithEmailAndPassword(
          email: userEmail,
          password: password,
        );
      }

      // Handle "remember me" option
      if (rememberMe) {
        await _firebaseAuth.setPersistence(Persistence.LOCAL);
      } else {
        await _firebaseAuth.setPersistence(Persistence.SESSION);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else {
        throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('Password reset failed: ${e.message}');
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
}
