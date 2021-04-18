import 'dart:core';

import 'package:khoi_nghiep/features/khoinghiep/data/models/user_data.dart';

class UserInformation extends UserData {
  var _avatar, _backGround;
  List<String> _following = [];

  UserInformation(
      {avatar,
      backGround,
      following,
      name,
      email,
      userID,
      phoneNumber,
      password,
      userName})
      : super(
            name: name,
            email: email,
            userID: userID,
            phoneNumber: phoneNumber,
            userName: userName,
            password: password);


}
