import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stefanini_flutter_test/app/modules/login/login_imports.dart';

import '../../domain/usecases/signIn_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.signInUseCase) : super(LoginInitial());
  final SignInUseCase signInUseCase;

  TextEditingController emailEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();
  bool remember = true;
  Future<void> signIn() async {
    emit(SignInLoading());
    final result = await signInUseCase(SignInParams(
        email: emailEditController.text.trim(),
        password: passwordEditController.text.trim()));

    result.fold(
      (failure) => emit(
        SignInError(),
      ),
      (_) => emit(
        SignInSucess(),
      ),
    );
  }

  setRemember(bool value) {
    remember = value;
    fetch();
  }

  fetch() {
    emit(Fetching());
    emit(Fetched());
  }

  bool getButtonStatus() {
    return (EmailInputFormatter.validateEmail(
                emailEditController.text.trim()) ==
            null &&
        passwordEditController.text.isNotEmpty &&
        state is! SignInLoading);
  }
}
