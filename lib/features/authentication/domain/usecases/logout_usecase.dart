import 'package:khoi_nghiep/common/usecases/usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/repositories/firebase_repositories.dart';

class LogOutUseCase implements UseCase<bool, NoParams> {
  final FirebaseRepositories firebaseRepositories;

  LogOutUseCase(this.firebaseRepositories);

  @override
  Future<dynamic> call(NoParams params) async {
    return await firebaseRepositories.logOut();
  }
}
