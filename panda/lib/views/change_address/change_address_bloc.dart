import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pandamedical/widgets/vital.dart';

part 'change_address_event.dart';
part 'change_address_state.dart';

class ChangeAddressBloc extends Bloc<ChangeAddressEvent, ChangeAddressState> {
  ChangeAddressBloc(super.initialState);

  @override
  void onTransition(
      Transition<ChangeAddressEvent, ChangeAddressState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<ChangeAddressState> mapEventToState(ChangeAddressEvent event) async* {}
}
