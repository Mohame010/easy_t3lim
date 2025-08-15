part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final SignUpResponseModel signUpResponseModel;

  SignUpSuccessState({required this.signUpResponseModel});
}

class SignUpFailureState extends SignUpState {
  final String erroreMessag;

  SignUpFailureState({required this.erroreMessag});
}

class SignUpLoadingState extends SignUpState {}
