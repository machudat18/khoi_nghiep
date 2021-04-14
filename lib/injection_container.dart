import 'package:khoi_nghiep/features/khoinghiep/data/datasources/auth_data_source.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/datasources/storage_data_source.dart';
import 'package:khoi_nghiep/features/khoinghiep/data/repositories/auth_repositories_impl.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/login_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/domain/usecases/logout_usecase.dart';
import 'package:khoi_nghiep/features/khoinghiep/presentation/bloc/auth/auth_bloc.dart';
import 'package:kiwi/kiwi.dart';

final KiwiContainer kiwiContainer = KiwiContainer();

Future<void> init() async {
  // data source
  kiwiContainer.registerSingleton<StorageDataSourceImpl>(
      (container) => StorageDataSourceImpl());
  kiwiContainer.registerSingleton<AuthDataSourceImpl>(
      (container) => AuthDataSourceImpl());

  // repositories
  kiwiContainer.registerSingleton<FirebaseRepositoriesImpl>((container) =>
      FirebaseRepositoriesImpl(
          storageDataSource: container.resolve<StorageDataSourceImpl>(),
          authDataSource: container.resolve<AuthDataSourceImpl>()));

  //useCase
  kiwiContainer.registerSingleton<LogInUseCase>(((container) =>
      LogInUseCase(kiwiContainer.resolve<FirebaseRepositoriesImpl>())));
  kiwiContainer.registerSingleton<LogOutUseCase>(((container) =>
      LogOutUseCase(kiwiContainer.resolve<FirebaseRepositoriesImpl>())));

// bloc
  kiwiContainer.registerFactory((container) => AuthBloc(
      logInUseCase: container.resolve<LogInUseCase>(),
      logOutUseCase: container.resolve<LogOutUseCase>()));
}
