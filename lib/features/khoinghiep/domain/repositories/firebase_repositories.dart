import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class FirebaseRepositories {
  Future signInWithEmailAndPassword({final email, final password});

  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister);

  Future signOut();

  getUserID();

  Future<void> addUser({UserInformationRegister user, String uid});

  Future<void> uploadTopic(String uid, String content);

  Stream<DocumentSnapshot> get userData;

  Future<String> uploadFile(final file);

  Future<void> getAllPosts();
}
