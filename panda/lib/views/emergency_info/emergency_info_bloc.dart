import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'emergency_info_event.dart';
part 'emergency_info_state.dart';

class EmergencyInfoBloc extends Bloc<EmergencyInfoEvent, EmergencyInfoState> {
  EmergencyInfoBloc(super.initialState);

  @override
  void onTransition(
      Transition<EmergencyInfoEvent, EmergencyInfoState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  bool validatePhone(String phoneNumber) {
    if (phoneNumber.length == 13 || phoneNumber.length == 14) {
      return true;
    }
    return false;
  }

  Stream<EmergencyInfoState> mapEventToState(EmergencyInfoEvent event) async* {
    if (event is InitEmergencyInfo) {
      yield state.copyWith(
        phoneVerified: false,
      );
    } else if (event is ValidateNumber) {
      print(event.phoneNumber);
      if (validatePhone(event.phoneNumber)) {
        yield state.copyWith(phoneVerified: true, phone: event.phoneNumber);
      } else {
        yield state.copyWith(
          phoneVerified: false,
        );
      }
    }
  }
}
