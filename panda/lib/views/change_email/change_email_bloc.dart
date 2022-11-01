import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_email_event.dart';
part 'change_email_state.dart';

class ChangeEmailBloc extends Bloc<ChangeEmailEvent, ChangeEmailState> {
  ChangeEmailBloc(super.initialState);

  @override
  void onTransition(Transition<ChangeEmailEvent, ChangeEmailState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<ChangeEmailState> mapEventToState(ChangeEmailEvent event) async* {
    if (event is InitChangeEmail) {
      yield state.copyWith(
        showPassword: true,
      );
    } else if (event is ViewPassword) {
      yield state.copyWith(
        showPassword: !state.showPassword!,
      );
    }
  }
}
