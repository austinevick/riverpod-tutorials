part of 'hospitals_list_bloc.dart';

class HospitalsListState extends Equatable {
  final String? hospitalsList;
  final bool? hospitalsListVerified;
  final BuildContext? context;

  const HospitalsListState(
      {this.hospitalsList, this.hospitalsListVerified, this.context});

  HospitalsListState copyWith(
      {String hospitalsList = '',
      bool? hospitalsListVerified,
      BuildContext? context}) {
    return HospitalsListState(
        hospitalsList: hospitalsList,
        context: context ?? this.context,
        hospitalsListVerified:
            hospitalsListVerified ?? this.hospitalsListVerified);
  }

  @override
  List<Object> get props =>
      [hospitalsList!, hospitalsListVerified!, context!]; //HospitalsList

  @override
  bool get stringify => true;
}
