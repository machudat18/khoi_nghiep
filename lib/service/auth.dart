import 'package:firebase_auth/firebase_auth.dart';
import 'package:khoi_nghiep/model/UserInformationRegister.dart';
import 'package:khoi_nghiep/service/storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  Stream<User> getStreamUser() {
    return _auth.authStateChanges();
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in  with email and password
  Future signInWithEmailAndPassword({final email, final password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userInformationRegister.email,
              password: userInformationRegister.password);
      User user = result.user;
      print(user.email);
      await user.updateProfile(displayName: userInformationRegister.name);
      await StorageService().addUser(user: userInformationRegister);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  FirebaseAuth get auth => _auth;

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
