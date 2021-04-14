import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:khoi_nghiep/core/usecases/usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/login_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/logout_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_event.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {@required LogInUseCase logInUseCase,
      @required LogOutUseCase logOutUseCase})
      : assert(logInUseCase != null),
        _logInUseCase = logInUseCase,
        _logOutUseCase = logOutUseCase,
        assert(logOutUseCase != null),
        super(UnKnow()) {
    _userSubscription = _logInUseCase.firebaseRepositories.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  final LogInUseCase _logInUseCase;
  final LogOutUseCase _logOutUseCase;
  StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    print(event);
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is SignOut) {
      _logOutUseCase.call(NoParams());
    } else if (event is LoginEvent) {
      _logInUseCase.call(LoginParam(event.email, event.password));
    }
  }

  AuthState _mapAuthenticationUserChangedToState(
    AuthenticationUserChanged event,
  ) {
    return event.user != null
        ? Authenticated(user: event.user)
        : Unauthenticated();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
