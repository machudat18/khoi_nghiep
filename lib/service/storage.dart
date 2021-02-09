import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoi_nghiep/model/UserInformationRegister.dart';

class StorageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  static final StorageService _singleton = StorageService._internal();

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  Future<void> addUser({UserInformationRegister user}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': user.name,
          'email': user.email,
          'userName': user.userName,
          'phoneNumber': user.phoneNumber
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Stream<QuerySnapshot> get userData{
    return users.snapshots();
  }
}
