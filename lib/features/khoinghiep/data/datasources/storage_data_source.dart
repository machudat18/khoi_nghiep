import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class StorageDataSource {
  Future<void> addUser({UserInformationRegister user, String uid});

  Future<void> uploadTopic(String uid, String content);

  Stream<DocumentSnapshot> getUserData(final uid);

  Future<String> uploadFile(final file);

  Future<void> getAllPosts();
}

class StorageDataSourceImpl implements StorageDataSource {
  Reference _ref = FirebaseStorage.instance.ref();
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('Users');

  Future<void> addUser({UserInformationRegister user, String uid}) {
    // Call the user's CollectionReference to add a new user
    return _users
        .doc(uid)
        .set({
          'name': user.name,
          'email': user.email,
          'userName': user.userName,
          'phoneNumber': user.phoneNumber
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> uploadTopic(String uid, String content) {
    return _users
        .doc(uid)
        .collection('Post')
        .doc()
        .set({'content': content})
        .then((value) => print("post added"))
        .catchError((error) => print("Failed to add post: $error"));
    ;
  }

  Stream<DocumentSnapshot> getUserData(final uid) {
    return _users.doc('$uid').snapshots();
  }

  Future<String> uploadFile(final file) async {
    try {
      File f = file;
      String path = '${(f.path).split('/').last}';
      await _ref.child(path).putFile(file);
      return await downloadURL(path);
    } on FirebaseException catch (e) {
      print(e.code.toString());
      return null;
      // e.g, e.code == 'canceled'
    }
  }

  Future<String> downloadURL(final path) async {
    // Within your widgets:
    // Image.network(downloadURL);
    final url = await _ref.child(path).getDownloadURL();
    return url;
  }

  Future<void> getAllPosts() {
    print('get all post');
    final ref = _fireStore.collection('Users');
    return ref.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            ref
                .doc(doc.id)
                .collection('Post')
                .get()
                .then((QuerySnapshot querySnapshot) => {
                      querySnapshot.docs.forEach((doc) {
                        print(doc.id);
                      })
                    });
          })
        });
  }
}
