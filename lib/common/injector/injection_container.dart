import 'package:khoi_nghiep/common/loading_bloc/loading_bloc.dart';
import 'package:khoi_nghiep/features/authentication//data/datasources/auth_data_source.dart';
import 'package:khoi_nghiep/features/authentication/data/datasources/storage_data_source.dart';
import 'package:khoi_nghiep/features/authentication/data/repositories/auth_repositories_impl.dart';
import 'package:khoi_nghiep/features/authentication/domain/usecases/login_usecase.dart';
import 'package:khoi_nghiep/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:khoi_nghiep/features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:kiwi/kiwi.dart';

final KiwiContainer injector = KiwiContainer();

Future<void> init() async {
  // data source
  injector.registerSingleton<StorageDataSourceImpl>(
      (container) => StorageDataSourceImpl());
  injector.registerSingleton<AuthDataSourceImpl>(
      (container) => AuthDataSourceImpl());

  // repositories
  injector.registerSingleton<FirebaseRepositoriesImpl>((container) =>
      FirebaseRepositoriesImpl(
          storageDataSource: container.resolve<StorageDataSourceImpl>(),
          authDataSource: container.resolve<AuthDataSourceImpl>()));
  injector.registerSingleton((container) => null)

  //useCase
  injector.registerSingleton<LogInUseCase>(((container) =>
      LogInUseCase(injector.resolve<FirebaseRepositoriesImpl>())));
  injector.registerSingleton<LogOutUseCase>(((container) =>
      LogOutUseCase(injector.resolve<FirebaseRepositoriesImpl>())));

// bloc
  injector.registerFactory((container) => AuthBloc(
      logInUseCase: container.resolve<LogInUseCase>(),
      logOutUseCase: container.resolve<LogOutUseCase>()));
  injector.registerSingleton((container) => LoadingBloc());
}
