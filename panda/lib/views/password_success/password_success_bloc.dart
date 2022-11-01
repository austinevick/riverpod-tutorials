import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_success_event.dart';
part 'password_success_state.dart';

class PasswordSuccessBloc
    extends Bloc<PasswordSuccessEvent, PasswordSuccessState> {
  PasswordSuccessBloc(super.initialState);

  @override
  void onTransition(
      Transition<PasswordSuccessEvent, PasswordSuccessState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<PasswordSuccessState> mapEventToState(
      PasswordSuccessEvent event) async* {
    if (event is Submit) {
      yield state.copyWith();
    }
  }
}
