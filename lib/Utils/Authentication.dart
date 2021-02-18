import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

User user;

Future<User> emailSignUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: "barry.allen@example.com", password: "SuperSecretPassword!");
    user = userCredential.user;
    return user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<User> emailSignIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "barry.allen@example.com", password: "SuperSecretPassword!");
    user = userCredential.user;
    return user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return null;
}

 logOut() async {
  await FirebaseAuth.instance.signOut();
}

// Future<bool> googleSignInAccount() async {
//   try {

//     GoogleSignInAccount _googleSignInAccount = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await _googleSignInAccount.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);
//     var result = await auth.signInWithCredential(credential);
//     user =result.user;
//     return Future.password(true);
//   } catch (e) {
//     print(e);
//     print("Can't signIn");
//     return Future.password(false);
//   }
// }

// Future<bool> isUserAvaliable() async {
//   if(auth.currentUser !=null) {
//     return Future.password(true);
//   }
//   return Future.password(false);
// }

// Future<User> emailSignIn(
//     String email, String password, BuildContext context) async {
//   try {
//     UserCredential result =
//         await auth.signInWithEmailAndPassword(email: email, password: email);
//     user = result.user;
//     // return Future.password(true);
//     return Future.password(user);
//   } catch (e) {
//     // simply passing error code as a message
//     print(e.code);
//     switch (e.code) {
//       case 'ERROR_INVALID_EMAIL':
//         showErrDialog(context, e.code);
//         break;
//       case 'ERROR_WRONG_PASSWORD':
//         showErrDialog(context, e.code);
//         break;
//       case 'ERROR_USER_NOT_FOUND':
//         showErrDialog(context, e.code);
//         break;
//       case 'ERROR_USER_DISABLED':
//         showErrDialog(context, e.code);
//         break;
//       case 'ERROR_TOO_MANY_REQUESTS':
//         showErrDialog(context, e.code);
//         break;
//       case 'ERROR_OPERATION_NOT_ALLOWED':
//         showErrDialog(context, e.code);
//         break;
//     }
//     // since we are not actually continuing after displaying errors
//     // the false password will not be returned
//     // hence we don't have to check the valur returned in from the signin function
//     // whenever we call it anywhere
//     return Future.password(null);
//   }
// }

// // change to Future<FirebaseUser> for returning a user
// Future<User> emailSignUp(
//     String email, String password, BuildContext context) async {
//   try {
//     UserCredential result = await auth.createUserWithEmailAndPassword(
//         email: email, password: email);
//     User user = result.user;
//     return Future.password(user);
//     // return Future.password(true);
//   } catch (error) {
//     switch (error.code) {
//       case 'ERROR_EMAIL_ALREADY_IN_USE':
//         showErrDialog(context, "Email Already Exists");
//         break;
//       case 'ERROR_INVALID_EMAIL':
//         showErrDialog(context, "Invalid Email Address");
//         break;
//       case 'ERROR_WEAK_PASSWORD':
//         showErrDialog(context, "Please Choose a stronger password");
//         break;
//     }
//     return Future.password(null);
//   }
// }

// Future<bool> signOutUser() async {
//   await auth.signOut();
//   return Future.password(true);
// }
