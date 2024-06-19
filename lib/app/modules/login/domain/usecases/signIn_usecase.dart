import 'package:equatable/equatable.dart';

import '../../../core/interfaces/types/type_defs.dart';
import '../../../core/interfaces/usecases/usecases.dart';
import '../repos/login_repo.dart';

class SignInUseCase extends UsecaseWithParams<void, SignInParams> {
  const SignInUseCase(this._repo);

  final LoginRepo _repo;

  @override
  ResultFuture<void> call(SignInParams params) => _repo.signIn(params);
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
