import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoi_nghiep/model/UserInformationRegister.dart';
import 'package:khoi_nghiep/service/auth.dart';

class StorageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  Future<void> addUser({UserInformationRegister user, String uid}) {
    // Call the user's CollectionReference to add a new user
    return users
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

  Stream<DocumentSnapshot> get userData {
    return users.doc('/${AuthService().auth.currentUser.uid}').snapshots();
  }
}
