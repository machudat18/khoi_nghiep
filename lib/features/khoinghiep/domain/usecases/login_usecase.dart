import 'package:khoi_nghiep/core/usecases/usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/models/user_data.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/repositories/firebase_repositories.dart';

class LogInUseCase implements UseCase<UserData, LoginParam> {
  final FirebaseRepositories firebaseRepositories;

  LogInUseCase(this.firebaseRepositories);

  @override
  Future<dynamic> call(LoginParam params) async {
    return await firebaseRepositories.signInWithEmailAndPassword(email: params.email,password: params.password);
  }
}

class LoginParam {
  final email, password;

  LoginParam(this.email, this.password);

  @override
  String toString() {
    return 'LoginParam{email: $email, password: $password}';
  }
}
