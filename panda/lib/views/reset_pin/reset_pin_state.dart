part of 'reset_pin_bloc.dart';

class ResetPinState extends Equatable {
  final String? resetPin;
  final bool? resetPinVerified;
  final BuildContext? context;

  const ResetPinState({this.resetPin, this.resetPinVerified, this.context});

  ResetPinState copyWith(
      {String resetPin = '', bool? resetPinVerified, BuildContext? context}) {
    return ResetPinState(
        resetPin: resetPin,
        context: context ?? this.context,
        resetPinVerified: resetPinVerified ?? this.resetPinVerified);
  }

  @override
  List<Object> get props => [resetPin!, resetPinVerified!, context!]; //ResetPin

  @override
  bool get stringify => true;
}
