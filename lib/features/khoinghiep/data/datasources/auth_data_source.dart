import 'package:firebase_auth/firebase_auth.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class AuthDataSource {
  Future signInWithEmailAndPassword({final email, final password});

  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister);

  Future signOut();

  getUserID();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword({final email, final password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
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

// sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getUserID() {
    return auth.currentUser.uid;
  }
}
