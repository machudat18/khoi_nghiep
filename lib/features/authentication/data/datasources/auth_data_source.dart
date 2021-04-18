import 'package:firebase_auth/firebase_auth.dart';
import 'package:khoi_nghiep/common/error/exceptions.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class AuthDataSource {
  Future signInWithEmailAndPassword({final email, final password});

  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister);

  Future signOut();

  get user;

  getUserID();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future signInWithEmailAndPassword({final email, final password}) async {
    print(email);

    try {
      print(auth);
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print('dasdasdas');
      return user;
    }
    on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
    on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Stream<User> get user {
    return auth.authStateChanges();
  }

// register with email and password
  @override
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
    }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    //   throw SignUpFailure();
    // }
    on Exception {
      throw SignUpFailure();
    }
  }

// sign out
  @override
  Future signOut() async {
    try {
      return await auth.signOut();
    } on Exception {
      throw LogOutFailure();
    }
  }

  @override
  getUserID() {
    return auth.currentUser.uid;
  }
}
