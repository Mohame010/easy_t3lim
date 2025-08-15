part of 'login_cubit.dart';

@immutable
abstract class LogInState {}

class LogInInitialState extends LogInState {}

class LogInSuccessState extends LogInState {
  final LoginResponseModel responseModel;

  LogInSuccessState({required this.responseModel});
}

class LogInFailureState extends LogInState {
  final String erroreMessag;
  LogInFailureState({required this.erroreMessag});
}

class LogInLoadingState extends LogInState {}

class PasswordIconState extends LogInState {}
