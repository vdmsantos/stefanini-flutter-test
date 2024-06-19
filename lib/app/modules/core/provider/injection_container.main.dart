import 'package:get_it/get_it.dart';
import 'package:stefanini_flutter_test/app/modules/login/data/datasources/login_data_source.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/repos/login_repo.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/usecases/signIn_usecase.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initCategories();
}

Future _initCategories() async {
  sl
    ..registerLazySingleton(() => LoginCubit(sl()))
    ..registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl()))
    ..registerLazySingleton<LoginRepo>(() => LoginRepoImpl(sl()))
    ..registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
}
