import 'package:stefanini_flutter_test/app/modules/core/errors/exceptions.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/usecases/signIn_usecase.dart';

abstract class LoginDataSource {
  const LoginDataSource();

  Future<void> signIn(SignInParams signInParams);
}

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<void> signIn(SignInParams signInParams) async {
    try {
      //Simula o tempo de uma requisicão
      await Future.delayed(const Duration(seconds: 2));
      if (signInParams.password == 'Password1!' &&
          signInParams.email == 'teste@gmail.com') {
        return;
      }
      throw ClientException(
          message: ErrorStrings.invalidCredentials, statusCode: 401);
    } on ServerException catch (_) {
      rethrow;
    } on ClientException catch (_) {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
