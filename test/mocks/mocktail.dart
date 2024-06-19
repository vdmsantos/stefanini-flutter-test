import 'package:mocktail/mocktail.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/usecases/signIn_usecase.dart';

final class MockSignInUseCase extends Mock implements SignInUseCase {}

sealed class LoginMocks {
  static SignInParams signInParams = const SignInParams(
    password: 'Password1!',
    email: 'teste@gmail.com',
  );
}
