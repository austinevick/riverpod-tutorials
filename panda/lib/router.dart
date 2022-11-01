import 'package:flutter/material.dart';
import 'package:pandamedical/models/auth_user_response.dart';
import 'package:pandamedical/models/lab_result_history.dart';
import 'package:pandamedical/models/medical_specialty_response.dart';
import 'package:pandamedical/models/physician_response.dart';
import 'package:pandamedical/models/vital_history_response.dart';
import 'package:pandamedical/models/vital_options_response.dart';
import 'package:pandamedical/views/booking_complete/booking_complete_view.dart';
import 'package:pandamedical/views/dashboard/dashboard_view.dart';
import 'package:pandamedical/views/dashboard/home.dart';
import 'package:pandamedical/views/doctor_detail/doctor_detail_view.dart';
import 'package:pandamedical/views/doctors/doctors_view.dart';
import 'package:pandamedical/views/doctors_list/doctors_list_view.dart';
import 'package:pandamedical/views/hospitals_list/hospitals_list_view.dart';
import 'package:pandamedical/views/lab_detail/lab_detail_view.dart';
import 'package:pandamedical/views/login/login_view.dart';
import 'package:pandamedical/views/my_appointments/my_appointments_view.dart';
import 'package:pandamedical/views/otp_screen/otp_view.dart';
import 'package:pandamedical/views/select_slot/select_slot_view.dart';
import 'package:pandamedical/views/set_pin/set_pin_view.dart';
import 'package:pandamedical/views/reset_pin/reset_pin_view.dart';
import 'package:pandamedical/views/register/register_view.dart';
import 'package:pandamedical/views/splash_screen/splash_screen.dart';
import 'package:pandamedical/views/set_fingerprint/fingerprint_view.dart';
import 'package:pandamedical/views/appointment/appointment_view.dart';
import 'package:pandamedical/views/forgot_pass/forgot_pass_view.dart';
import 'package:pandamedical/views/recover_with_email/rw_email_view.dart';
import 'package:pandamedical/views/recover_with_phone/rw_phone_view.dart';
import 'package:pandamedical/views/password_otp/password_otp_view.dart';
import 'package:pandamedical/views/hospital/hospital_view.dart';
import 'package:pandamedical/views/confirm_booking/confirm_booking_view.dart';
import 'package:pandamedical/views/add_vital/add_vital_view.dart';
import 'package:pandamedical/views/vitals/vitals_view.dart';
import 'package:pandamedical/views/lab_results/lab_results_view.dart';
import 'package:pandamedical/views/add_lab_result/add_lab_result_view.dart';
import 'package:pandamedical/views/facilities/facilities_view.dart';
import 'package:pandamedical/views/profile/profile_view.dart';
import 'package:pandamedical/views/primary_specialist/primary_specialist_view.dart';
import 'package:pandamedical/views/change_address/change_address_view.dart';
import 'package:pandamedical/views/change_email/change_email_view.dart';
import 'package:pandamedical/views/change_insurance/change_insurance_view.dart';
import 'package:pandamedical/views/change_password/change_password_view.dart';
import 'package:pandamedical/views/change_passcode/change_passcode_view.dart';
import 'package:pandamedical/views/change_phone/change_phone_view.dart';
import 'package:pandamedical/views/change_unit/change_unit_view.dart';
import 'package:pandamedical/views/emergency_info/emergency_info_view.dart';
import 'package:pandamedical/views/blood_type/blood_type_view.dart';
import 'package:pandamedical/views/vital_detail/vital_detail_view.dart';
import 'package:pandamedical/views/vital_detail/list_detail_view.dart';
import 'package:pandamedical/views/medical_records/records.dart';

import 'constants/routing_constants.dart';
import 'views/password_success/password_success_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case LauncherScreen:
      return MaterialPageRoute(
          settings: const RouteSettings(name: LauncherScreen),
          builder: (context) => SplashScreen());

    case LoginViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: LoginViewRoute),
          builder: (context) => const LoginScreen()); //

    case RegisterViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: RegisterViewRoute),
          builder: (context) => const RegisterScreen()); //
    case OtpViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: OtpViewRoute),
          builder: (context) => OtpScreen());
    case SetPinViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: SetPinViewRoute),
          builder: (context) => SetPinScreen());
    case ResetPinViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ResetPinViewRoute),
          builder: (context) => ResetPinScreen());
    case FingerprintViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: FingerprintViewRoute),
          builder: (context) => const FingerPrintView());
    case HomeRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: HomeRoute),
          builder: (context) => const DashboardView());
    case DashboardViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: DashboardViewRoute),
          builder: (context) => const Home());
    case AppointmentViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: AppointmentViewRoute),
          builder: (context) => AppointmentView());
    case MyAppointmentViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: MyAppointmentViewRoute),
          builder: (context) => const MyAppointmentView());
    case DoctorsViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: DoctorsViewRoute),
          builder: (context) => DoctorsView());
    case DoctorsListViewRoute:
      var obj = settings.arguments as Listt;
      return MaterialPageRoute(
          settings: const RouteSettings(name: DoctorsListViewRoute),
          builder: (context) => DoctorsListView(doctorType: obj));
    case HospitalsListViewRoute:
      var obj = settings.arguments as String; // arguments: 'Ophthalmologist'
      return MaterialPageRoute(
          settings: const RouteSettings(name: HospitalsListViewRoute),
          builder: (context) => HospitalsListView(hospitalType: obj));

    case LabDetailViewRoute:
      var obj =
          settings.arguments as LabResultData; // arguments: 'Ophthalmologist'
      return MaterialPageRoute(
          settings: const RouteSettings(name: LabDetailViewRoute),
          builder: (context) => LabDetailView(data: obj));
    //View
    case VitalHistoryViewRoute:
      var obj = settings.arguments
          as List<VitalHistoryData>; // arguments: 'Ophthalmologist'
      return MaterialPageRoute(
          settings: const RouteSettings(name: VitalHistoryViewRoute),
          builder: (context) => VitalHistoryView(data: obj));
    case VitalDetailViewRoute:
      var obj = settings.arguments
          as VitalHistoryData; // arguments: 'Ophthalmologist'
      return MaterialPageRoute(
          settings: const RouteSettings(name: VitalDetailViewRoute),
          builder: (context) => VitalDetailView(data: obj));
    case ForgotPassRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ForgotPassRoute),
          builder: (context) => ForgotPassScreen());
    case RecoverWithEmailRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: RecoverWithEmailRoute),
          builder: (context) => RecoverWithEmailScreen());
    case RecoverWithPhoneRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: RecoverWithPhoneRoute),
          builder: (context) => RecoverWithPhoneScreen());
    case PasswordOtpRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: PasswordOtpRoute),
          builder: (context) => PasswordOtpScreen());
    case PasswordSuccessRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: PasswordSuccessRoute),
          builder: (context) => PasswordSuccessScreen());
    case HospitalRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: HospitalRoute),
          builder: (context) => HospitalView());
    case DoctorDetailViewRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: DoctorDetailViewRoute),
          builder: (context) => DoctorDetailView());
    case SelectSlotViewRoute:
      var obj = settings.arguments as Physicians;
      return MaterialPageRoute(
          settings: const RouteSettings(name: SelectSlotViewRoute),
          builder: (context) => SelectSlotView(data: obj));
    case ConfirmBookingViewRoute:
      var obj = settings.arguments;
      return MaterialPageRoute(
          settings: const RouteSettings(name: ConfirmBookingViewRoute),
          builder: (context) => ConfirmBookingView(data: obj));
    case BookingCompleteRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: BookingCompleteRoute),
          builder: (context) => BookingCompleteView());
    case MyVitalsRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: MyVitalsRoute),
          builder: (context) => const VitalsView());
    case VitalsRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: VitalsRoute),
          builder: (context) => const VitalsView());
    case LabResultsRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: LabResultsRoute),
          builder: (context) => const LabResultsView());
    case MedicalRecordsRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: MedicalRecordsRoute),
          builder: (context) => MedicalRecordsView());
    case AddLabResultRoute:
      //var obj = settings.arguments;
      return MaterialPageRoute(
          settings: const RouteSettings(name: AddLabResultRoute),
          builder: (context) => const AddLabResultView());
/*
         */
    case AddVitalRoute:
      var obj = settings.arguments as List<VitalData>;
      return MaterialPageRoute(
          settings: const RouteSettings(name: AddVitalRoute),
          builder: (context) => AddVitalView(vitalOptions: obj));
    case FacilitiesRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: FacilitiesRoute),
          builder: (context) => FacilitiesView());
    case ProfileRoute:
      var obj = settings.arguments as User;
      return MaterialPageRoute(
          settings: const RouteSettings(name: ProfileRoute),
          builder: (context) => ProfileScreen(user: obj));
    case PrimarySpecialistRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: PrimarySpecialistRoute),
          builder: (context) => PrimarySpecialistView());

    case ChangePhoneRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangePhoneRoute),
          builder: (context) => const ChangePhoneView());
    case ChangeEmailRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangeEmailRoute),
          builder: (context) => const ChangeEmailView());
    case ChangeAddressRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangeAddressRoute),
          builder: (context) => ChangeAddressView());
    case ChangePasswordRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangePasswordRoute),
          builder: (context) => ChangePasswordView());
    case ChangePasscodeRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangePasscodeRoute),
          builder: (context) => ChangePasscodeView());
    case ChangeUnitsRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangeUnitsRoute),
          builder: (context) => ChangeUnitView());
    case ChangeInsuranceRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: ChangeInsuranceRoute),
          builder: (context) => ChangeInsuranceView());
    case BloodTypeRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: BloodTypeRoute),
          builder: (context) => const BloodTypeView());

    case EmergencyInformationRoute:
      return MaterialPageRoute(
          settings: const RouteSettings(name: EmergencyInformationRoute),
          builder: (context) => EmergencyInfoView());

    default:
      return MaterialPageRoute(
          settings: const RouteSettings(name: EmergencyInformationRoute),
          builder: (context) => const Scaffold());
  }
}
