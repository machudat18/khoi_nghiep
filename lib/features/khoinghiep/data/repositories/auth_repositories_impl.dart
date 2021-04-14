import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/datasources/auth_data_source.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/datasources/storage_data_source.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/repositories/firebase_repositories.dart';

class FirebaseRepositoriesImpl extends FirebaseRepositories {
  final StorageDataSource storageDataSource;
  final AuthDataSource authDataSource;

  FirebaseRepositoriesImpl(
      {@required this.storageDataSource, @required this.authDataSource});

  @override
  Future<void> addUser({UserInformationRegister user, String uid}) {
    return storageDataSource.addUser(user: user, uid: uid);
  }

  @override
  Future<void> getAllPosts() {
    return storageDataSource.getAllPosts();
  }

  @override
  getUserID() {
    return authDataSource.getUserID();
  }

  @override
  Future registerWithEmailAndPassword(
      UserInformationRegister userInformationRegister) async {
    final user = await authDataSource
        .registerWithEmailAndPassword(userInformationRegister);
    if (user != null) {
      storageDataSource.addUser(user: user, uid: user.uid);
    }
    return user;
  }

  @override
  Future signInWithEmailAndPassword({final email, final password}) {
    return authDataSource.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future logOut() {
    return authDataSource.signOut();
  }

  @override
  Future<String> uploadFile(file) {
    return storageDataSource.uploadFile(file);
  }

  @override
  Future<void> uploadTopic(String uid, String content) {
    return storageDataSource.uploadTopic(uid, content);
  }

  @override
  Stream<DocumentSnapshot> get userData =>
      storageDataSource.getUserData(authDataSource.getUserID());

  @override
  Stream<User> get user => authDataSource.user;
}
