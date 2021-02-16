import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final googleSignIn = new GoogleSignIn();
FirebaseAuth auth = FirebaseAuth.instance;

User user;

Future<bool> googleSignInAccount() async {
  try {
    
    GoogleSignInAccount _googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await _googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    var result = await auth.signInWithCredential(credential);
    user = auth.currentUser;
    return Future.value(true);
  } catch (e) {
    print("Can't signIn");
    return Future.value(false);
  }
}

Future<bool> isUserAvaliable() async {
  if(auth.currentUser !=null) {
    return Future.value(true); 
  }
  return Future.value(false);
}

Future<bool> signOutUser() async {
  await googleSignIn.disconnect();
  await auth.signOut();
  return Future.value(true);
}
