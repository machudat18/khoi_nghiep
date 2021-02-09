class UserData {
  String _name, _email, _userID, _phoneNumber, _password, _userName;

  UserData({name, email, userID, phoneNumber, password, userName});

  get userName => _userName;

  set userName(value) {
    _userName = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get phoneNumber => _phoneNumber;

  set phoneNumber(value) {
    _phoneNumber = value;
  }

  get userID => _userID;

  set userID(value) {
    _userID = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
