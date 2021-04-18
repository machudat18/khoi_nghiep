import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_information_register.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final email, password;

  const LoginEvent({@required this.email, @required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
class SignOut extends AuthEvent {}
class AuthenticationUserChanged extends AuthEvent {
  const AuthenticationUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
class Register extends AuthEvent {
  final UserInformationRegister userInformationRegister;

  const Register({@required this.userInformationRegister});

  @override
  List<Object> get props => [userInformationRegister];
}

