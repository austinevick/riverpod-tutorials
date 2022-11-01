part of 'facilities_bloc.dart';

class FacilitiesState extends Equatable {
  final String? facilities;
  final bool? facilitiesVerified;
  final BuildContext? context;

  const FacilitiesState(
      {this.facilities, this.facilitiesVerified, this.context});

  FacilitiesState copyWith(
      {String? facilities = '',
      bool? facilitiesVerified,
      BuildContext? context}) {
    return FacilitiesState(
        facilities: facilities ?? this.facilities,
        context: context ?? this.context,
        facilitiesVerified: facilitiesVerified ?? this.facilitiesVerified);
  }

  @override
  List<Object> get props =>
      [facilities!, facilitiesVerified!, context!]; //Facilities

  @override
  bool get stringify => true;
}
