import 'package:bloc/bloc.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Home/data/model/home_request_body.dart';
import 'package:desktop_app/Feature/Home/data/repos/home_repo.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;
  String? token;
  void emitHomeState() async {
    emit(HomeLoadingState());
    final response = await homeRepo.home(HomeRequestBody(token: token!));
    response.when(
      success: (response) => emit(HomeSuccessState(respons: response)),
      failure: (error) => emit(HomeFailureState(error: error)),
    );
  }
}
