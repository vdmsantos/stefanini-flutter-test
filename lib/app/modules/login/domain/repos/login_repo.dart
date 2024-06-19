import 'package:dartz/dartz.dart';
import 'package:stefanini_flutter_test/app/modules/core/errors/exceptions.dart';
import 'package:stefanini_flutter_test/app/modules/login/data/datasources/login_data_source.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/usecases/signIn_usecase.dart';

import '../../../core/errors/failures.dart';
import '../../../core/interfaces/types/type_defs.dart';

abstract class LoginRepo {
  const LoginRepo();

  ResultFuture<void> signIn(SignInParams signInParams);
}

class LoginRepoImpl extends LoginRepo {
  final LoginDataSource loginDataSource;

  LoginRepoImpl(this.loginDataSource);
  @override
  ResultFuture<void> signIn(SignInParams signInParams) async {
    try {
      final result = await loginDataSource.signIn(signInParams);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message, statusCode: e.statusCode),
      );
    } on ClientException catch (e) {
      return Left(
        ClientFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
