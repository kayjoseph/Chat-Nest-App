import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //FROM CHATGPT $ SAGE POE

  // Get the currently authenticated user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign In user
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword
        (
          email: email,
          password: password
      );
      //save user info if it doesn't currently exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid,
            'email':email,
          }
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //Sign Up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async{
    try{
      //create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      //save user info in a separate document
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email':email,
        }
      );
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
  //Sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }
}
