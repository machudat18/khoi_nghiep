import 'dart:core';

class UserData {
  var _avatar, _backGround;
  String _name, _userID, _phoneNumber, _mail;
  List<UserData> following;

  UserData(this._avatar, this._backGround, this._name, this._userID,
      this._phoneNumber, this._mail, this.following);

  get mail => _mail;

  set mail(value) {
    _mail = value;
  }

  get phoneNumber => _phoneNumber;

  set phoneNumber(value) {
    _phoneNumber = value;
  }

  get userID => _userID;

  set userID(value) {
    _userID = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get backGround => _backGround;

  set backGround(value) {
    _backGround = value;
  }

  get avatar => _avatar;

  set avatar(value) {
    _avatar = value;
  }
}
