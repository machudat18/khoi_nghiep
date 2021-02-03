class DataSignUp {
  String _name, _phoneNumber, _email, _userName, _password,_rePassword;

  DataSignUp(this._name, this._phoneNumber, this._email, this._userName,
      this._password,this._rePassword);

  get password => _password;

  get rePassword => _rePassword;

  set rePassword(value) {
    _rePassword = value;
  }

  set password(value) {
    _password = value;
  }

  get userName => _userName;

  set userName(value) {
    _userName = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get phoneNumber => _phoneNumber;

  set phoneNumber(value) {
    _phoneNumber = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'UserInformation{_name: $_name, _phoneNumber: $_phoneNumber, _email: $_email, _userName: $_userName, _password: $_password}';
  }
}
