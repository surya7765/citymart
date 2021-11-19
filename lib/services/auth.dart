import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AnonymousUser? _anonymousUser(User user) {
    return user != null ? AnonymousUser(userid: user.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _anonymousUser(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _anonymousUser(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "Password is too weak");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "This account already exists");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String? getCurrentUser() {
    return _auth.currentUser != null
        ? _auth.currentUser!.email.toString()
        : null;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class AnonymousUser {
  String userid;
  AnonymousUser({required this.userid});
}
