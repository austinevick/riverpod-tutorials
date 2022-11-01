part of 'hospital_bloc.dart';

class HospitalState extends Equatable {
  final String? hospital;
  final bool? hospitalVerified;
  final BuildContext? context;

  const HospitalState({this.hospital, this.hospitalVerified, this.context});

  HospitalState copyWith(
      {String hospital = '', bool? hospitalVerified, BuildContext? context}) {
    return HospitalState(
        hospital: hospital,
        context: context ?? this.context,
        hospitalVerified: hospitalVerified ?? this.hospitalVerified);
  }

  @override
  List<Object> get props => [hospital!, hospitalVerified!, context!]; //Hospital

  @override
  bool get stringify => true;
}
