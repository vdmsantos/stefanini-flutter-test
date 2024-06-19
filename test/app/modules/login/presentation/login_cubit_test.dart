import 'package:dartz/dartz.dart';
import 'package:stefanini_flutter_test/app/modules/core/errors/exceptions.dart';
import 'package:stefanini_flutter_test/app/modules/core/errors/failures.dart';
import 'package:stefanini_flutter_test/app/modules/login/domain/usecases/signIn_usecase.dart';
import 'package:stefanini_flutter_test/app/modules/login/login_imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/cubit/login_cubit.dart';
import '../../../../mocks/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late SignInUseCase signInUseCase;
  late LoginCubit cubit;

  setUp(() {
    signInUseCase = MockSignInUseCase();
    cubit = LoginCubit(signInUseCase);
  });

  blocTest<LoginCubit, LoginState>(
    'Should emit SignInLoading and SignSuccess with the method signIn',
    build: () => cubit,
    setUp: () {
      cubit.emailEditController.text = LoginMocks.signInParams.email;
      cubit.passwordEditController.text = LoginMocks.signInParams.password;
      when(
        () => signInUseCase(LoginMocks.signInParams),
      ).thenAnswer((_) async => const Right(null));
    },
    act: (cubit) => cubit.signIn(),
    expect: () => [
      SignInLoading(),
      SignInSucess(),
    ],
  );
  blocTest<LoginCubit, LoginState>(
    'Should emit SignInError with the method signIn with wrong credentials',
    build: () => cubit,
    setUp: () {
      cubit.emailEditController.text = '';
      cubit.passwordEditController.text = '';
      when(
        () => signInUseCase(const SignInParams(email: '', password: '')),
      ).thenAnswer((_) async => Left(ClientFailure(
          message: ErrorStrings.invalidCredentials, statusCode: 401)));
    },
    act: (cubit) => cubit.signIn(),
    expect: () => [
      SignInLoading(),
      SignInError(),
    ],
  );
}
