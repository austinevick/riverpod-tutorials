part of 'doctor_detail_bloc.dart';

class DoctorDetailState extends Equatable {
  final String? doctorDetail;
  final bool? doctorDetailVerified;
  final BuildContext? context;

  const DoctorDetailState(
      {this.doctorDetail, this.doctorDetailVerified, this.context});

  DoctorDetailState copyWith(
      {String doctorDetail = '',
      bool? doctorDetailVerified,
      BuildContext? context}) {
    return DoctorDetailState(
        doctorDetail: doctorDetail,
        context: context ?? this.context,
        doctorDetailVerified:
            doctorDetailVerified ?? this.doctorDetailVerified);
  }

  @override
  List<Object> get props =>
      [doctorDetail!, doctorDetailVerified!, context!]; //DoctorDetail

  @override
  bool get stringify => true;
}
