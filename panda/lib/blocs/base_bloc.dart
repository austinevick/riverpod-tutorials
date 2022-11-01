import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pandamedical/views/dashboard/dashboard_bloc.dart';
import 'package:pandamedical/views/login/login_bloc.dart';
import 'package:pandamedical/views/register/register_bloc.dart';
import 'package:pandamedical/views/doctors_list/doctors_list_bloc.dart';
import 'package:pandamedical/views/hospitals_list/hospitals_list_bloc.dart';
import 'package:pandamedical/views/recover_with_phone/rw_phone_bloc.dart';
import 'package:pandamedical/views/recover_with_email/rw_email_bloc.dart';
import 'package:pandamedical/views/add_vital/add_vital_bloc.dart';
import 'package:pandamedical/views/my_vitals/my_vitals_bloc.dart';
import 'package:pandamedical/views/vitals/vitals_bloc.dart';
import 'package:pandamedical/views/add_lab_result/add_lab_result_bloc.dart';
import 'package:pandamedical/views/change_phone/change_phone_bloc.dart';

import 'package:pandamedical/views/change_address/change_address_bloc.dart';
import 'package:pandamedical/views/change_unit/change_unit_bloc.dart';
import 'package:pandamedical/views/change_email/change_email_bloc.dart';
import 'package:pandamedical/views/change_password/change_password_bloc.dart';
import 'package:pandamedical/views/change_passcode/change_passcode_bloc.dart';
import 'package:pandamedical/views/change_insurance/change_insurance_bloc.dart';
import 'package:pandamedical/views/emergency_info/emergency_info_bloc.dart';
import 'package:pandamedical/views/blood_type/blood_type_bloc.dart';
import 'package:pandamedical/views/primary_specialist/primary_specialist_bloc.dart';
import 'package:pandamedical/views/lab_results/lab_results_bloc.dart';
import 'package:pandamedical/views/doctors/doctors_bloc.dart';
import 'package:pandamedical/views/select_slot/select_slot_bloc.dart';
import 'package:pandamedical/views/confirm_booking/confirm_booking_bloc.dart';
import 'package:pandamedical/views/my_appointments/my_appointments_bloc.dart';

// import 'package:opsmanagerapp/blocs/auth.bloc.dart';
// import 'package:opsmanagerapp/blocs/drawer.bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget? child;

  const AppBlocProvider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(providers: [
      // ignore: unnecessary_new
      Provider<LoginBloc>.value(value: LoginBloc(const LoginState())),
      BlocProvider<RegisterBloc>.value(
          value: RegisterBloc(const RegisterState())),
      BlocProvider<DashboardBloc>.value(
          value: DashboardBloc(const DashboardState())),
      BlocProvider<DoctorsListBloc>.value(
          value: DoctorsListBloc(const DoctorsListState())),
      BlocProvider<RecoverWithPhoneBloc>.value(
          value: RecoverWithPhoneBloc(const RecoverWithPhoneState())),
      BlocProvider<RecoverWithEmailBloc>.value(
          value: RecoverWithEmailBloc(const RecoverWithEmailState())),
      BlocProvider<AddVitalBloc>.value(
          value: AddVitalBloc(const AddVitalState())),
      BlocProvider<AddLabResultBloc>.value(
          value: AddLabResultBloc(const AddLabResultState())),
      BlocProvider<HospitalsListBloc>.value(
          value: HospitalsListBloc(const HospitalsListState())),
      BlocProvider<ChangePhoneBloc>.value(
          value: ChangePhoneBloc(const ChangePhoneState())),
      BlocProvider<ChangeEmailBloc>.value(
          value: ChangeEmailBloc(const ChangeEmailState())),
      BlocProvider<ChangePasscodeBloc>.value(
          value: ChangePasscodeBloc(const ChangePasscodeState())),
      BlocProvider<ChangeInsuranceBloc>.value(
          value: ChangeInsuranceBloc(const ChangeInsuranceState())),
      BlocProvider<ChangePasswordBloc>.value(
          value: ChangePasswordBloc(const ChangePasswordState())),
      BlocProvider<ChangeUnitBloc>.value(
          value: ChangeUnitBloc(const ChangeUnitState())),
      BlocProvider<BloodTypeBloc>.value(
          value: BloodTypeBloc(const BloodTypeState())),
      BlocProvider<ChangeAddressBloc>.value(
          value: ChangeAddressBloc(const ChangeAddressState())),
      BlocProvider<EmergencyInfoBloc>.value(
          value: EmergencyInfoBloc(const EmergencyInfoState())),
      BlocProvider<PrimarySpecialistBloc>.value(
          value: PrimarySpecialistBloc(const PrimarySpecialistState())),
      BlocProvider<MyVitalsBloc>.value(
          value: MyVitalsBloc(const MyVitalsState())),
      BlocProvider<VitalsBloc>.value(value: VitalsBloc(const VitalsState())),
      BlocProvider<LabResultsBloc>.value(
          value: LabResultsBloc(const LabResultsState())),
      BlocProvider<DoctorsBloc>.value(value: DoctorsBloc(const DoctorsState())),
      BlocProvider<DoctorsListBloc>.value(
          value: DoctorsListBloc(const DoctorsListState())),
      BlocProvider<SelectSlotBloc>.value(
          value: SelectSlotBloc(const SelectSlotState())),
      BlocProvider<ConfirmBookingBloc>.value(
          value: ConfirmBookingBloc(const ConfirmBookingState())),
      BlocProvider<MyAppointmentBloc>.value(
          value: MyAppointmentBloc(const MyAppointmentState())),

      // BlocProvider<BillBloc>(create: (context) => BillBloc(),
      //   child: BillDashboard(),),
    ], child: child);
  }
}
