import 'package:khoi_nghiep/model/UserData.dart';

class UserInformationRegister extends UserData {
  String _password, _rePassword;

  UserInformationRegister(
      {name, phoneNumber, email, userName, password, rePassword, userID})
      : super(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            password: password,
            userID: userID,
            userName: userName);

  get password => _password;

  get rePassword => _rePassword;

  set rePassword(value) {
    _rePassword = value;
  }

  set password(value) {
    _password = value;
  }

}
