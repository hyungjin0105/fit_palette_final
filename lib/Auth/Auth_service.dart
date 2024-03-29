import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Page/MainHome.dart';
import '../Page/login.dart';

class AuthService{
  
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return MainHome(); 
        } else {
          return LoginPage();
        }
      },
    );
  }

  void signOut() {}

  void signInWithGoogle() {}
  
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

final DateTime timestamp = DateTime.now();
// final GoogleSignInAccount? gCurrentUser = googleSignIn.currentUser;

final userReference = FirebaseFirestore.instance.collection('users');
// User? currentUser;


signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // saveUserInfoFirestore();
    DocumentSnapshot documentSnapshot = await userReference.doc(googleUser.email).get();


FirebaseFirestore.instance.collection('users').doc(googleUser.id).get().then((doc) async {
  print('회원 관리');
   if (!doc.exists) {
     userReference.doc(googleUser.id).set({
       'id' : googleUser.id,
       'profileName' : googleUser.displayName,
       'url' : googleUser.photoUrl,
       'email' : googleUser.email,
       'serverAuthCode' : googleUser.serverAuthCode,
       'Timestamp' : timestamp
     }).whenComplete((){
       print('완료');
     });
   } else {
     print('이미 있는 아이디');
   }
});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


Future<void> signOut() async { // logOut 기능
    await _auth.signOut();
    print('logOut');
  }