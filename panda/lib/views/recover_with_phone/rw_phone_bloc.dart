import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rw_phone_event.dart';
part 'rw_phone_state.dart';

class RecoverWithPhoneBloc
    extends Bloc<RecoverWithPhoneEvent, RecoverWithPhoneState> {
  RecoverWithPhoneBloc(super.initialState);

  @override
  void onTransition(
      Transition<RecoverWithPhoneEvent, RecoverWithPhoneState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<RecoverWithPhoneState> mapEventToState(
      RecoverWithPhoneEvent event) async* {
    if (event is Submit) {
      yield state.copyWith();
    } else if (event is InitBloc) {
      yield state.copyWith(phoneVerified: false);
    }
  }
}
