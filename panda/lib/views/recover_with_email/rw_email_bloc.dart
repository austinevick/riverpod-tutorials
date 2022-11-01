import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rw_email_event.dart';
part 'rw_email_state.dart';

class RecoverWithEmailBloc
    extends Bloc<RecoverWithEmailEvent, RecoverWithEmailState> {
  RecoverWithEmailBloc(super.initialState);

  @override
  void onTransition(
      Transition<RecoverWithEmailEvent, RecoverWithEmailState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<RecoverWithEmailState> mapEventToState(
      RecoverWithEmailEvent event) async* {
    if (event is Submit) {
      yield state.copyWith();
    }
  }
}
