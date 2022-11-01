part of 'set_pin_bloc.dart';

class SetPinState extends Equatable {
  final String? setPin;
  final bool? setPinVerified;
  final BuildContext? context;

  const SetPinState({this.setPin, this.setPinVerified, this.context});

  SetPinState copyWith(
      {String setPin = '', bool? setPinVerified, BuildContext? context}) {
    return SetPinState(
        setPin: setPin,
        context: context ?? this.context,
        setPinVerified: setPinVerified ?? this.setPinVerified);
  }

  @override
  List<Object> get props => [setPin!, setPinVerified!, context!]; //SetPin

  @override
  bool get stringify => true;
}
