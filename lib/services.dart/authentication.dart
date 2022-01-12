import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internshiptasks/models.dart/userModel.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String pin) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pin);
  }

  UserData? _streamToModel(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  Stream get userData {
    return _auth.authStateChanges().map((_streamToModel));
  }
}
