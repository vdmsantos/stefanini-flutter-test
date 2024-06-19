part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignInLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class SignInError extends LoginState {
  @override
  List<Object?> get props => [];
}

final class SignInSucess extends LoginState {
  @override
  List<Object?> get props => [];
}

final class Fetching extends LoginState {
  @override
  List<Object?> get props => [];
}

final class Fetched extends LoginState {
  @override
  List<Object?> get props => [];
}
