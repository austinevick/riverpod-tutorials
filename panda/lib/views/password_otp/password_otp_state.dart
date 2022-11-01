part of 'password_otp_bloc.dart';

class PasswordOtpState extends Equatable {
  final String? passwordOtp;
  final bool? passwordOtpVerified;
  final BuildContext? context;

  const PasswordOtpState(
      {this.passwordOtp, this.passwordOtpVerified, this.context});

  PasswordOtpState copyWith(
      {String passwordOtp = '',
      bool? passwordOtpVerified,
      BuildContext? context}) {
    return PasswordOtpState(
        passwordOtp: passwordOtp,
        context: context ?? this.context,
        passwordOtpVerified: passwordOtpVerified ?? this.passwordOtpVerified);
  }

  @override
  List<Object> get props =>
      [passwordOtp!, passwordOtpVerified!, context!]; //PasswordOtp

  @override
  bool get stringify => true;
}
