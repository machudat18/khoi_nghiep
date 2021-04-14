import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class FirebaseRepositories {
  Future signInWithEmailAndPassword({final email, final password});

  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister);

  Future logOut();

  getUserID();

  Future<void> addUser({UserInformationRegister user, String uid});

  Future<void> uploadTopic(String uid, String content);

  Stream<DocumentSnapshot> get userData;
  Stream<User> get user;

  Future<String> uploadFile(final file);

  Future<void> getAllPosts();
}
