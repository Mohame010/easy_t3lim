part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final LoginResponseModel respons;

  HomeSuccessState({required this.respons});
}

class HomeFailureState extends HomeState {
  final String error;

  HomeFailureState({required this.error});
}
