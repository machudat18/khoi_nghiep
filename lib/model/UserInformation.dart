import 'dart:core';

import 'package:khoi_nghiep/model/UserData.dart';

class UserInformation extends UserData {
  var _avatar, _backGround;
  List<String> _following = new List<String>();

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

  get backGround => _backGround;

  set backGround(value) {
    _backGround = value;
  }

  get avatar => _avatar;

  set avatar(value) {
    _avatar = value;
  }

  List<String> get following => _following;

  set following(List<String> value) {
    _following = value;
  }
}
