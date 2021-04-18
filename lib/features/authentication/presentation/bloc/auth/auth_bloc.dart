import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:khoi_nghiep/common/loading_bloc/loading_bloc.dart';
import 'package:khoi_nghiep/common/loading_bloc/loading_event.dart';
import 'package:khoi_nghiep/common/usecases/usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/login_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/logout_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_event.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {@required LogInUseCase logInUseCase,
      @required LogOutUseCase logOutUseCase,
      @required LoadingBloc loadingBloc})
      : assert(logInUseCase != null),
        assert(loadingBloc != null),
        assert(logOutUseCase != null),
        _logInUseCase = logInUseCase,
        _logOutUseCase = logOutUseCase,
        _loadingBloc = loadingBloc,
        assert(logOutUseCase != null),
        super(UnKnow()) {
    _userSubscription = _logInUseCase.firebaseRepositories.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  final LogInUseCase _logInUseCase;
  final LogOutUseCase _logOutUseCase;
  final LoadingBloc _loadingBloc;
  StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    print(event);
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is SignOut) {
      _loadingBloc.add(StartLoading());
      await _logOutUseCase.call(NoParams());
      _loadingBloc.add(FinishLoading());
    } else if (event is LoginEvent) {
      _loadingBloc.add(StartLoading());
      await _logInUseCase.call(LoginParam(event.email, event.password));
      _loadingBloc.add(FinishLoading());
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
