import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated({this.user});
}

class Unauthenticated extends AuthState {}

class UnKnow extends AuthState {}
