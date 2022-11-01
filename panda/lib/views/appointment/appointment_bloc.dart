import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandamedical/models/medical_specialty_response.dart';
import 'package:pandamedical/repositories/medical_repository.dart';
import 'package:pandamedical/widgets/toasts.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/helpers/storage/storage.helper.dart';
part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc(super.initialState);
  @override
  void onTransition(Transition<AppointmentEvent, AppointmentState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    var repository = MedicalRepository();

    if (event is InitAppointment) {
      yield state.copyWith(
        datalist: [],
      );
    } else if (event is GetSpecialty) {
      //event.controller.loadData();
      //if failed,use loadFailed(),if no data return,use LoadNodata(), refreshCompleted, refreshFailed
      List<Listt> _datalist = [];
      var response = await repository.getSpecialty();
      if (response.status == 200) {
        response.data!.list!.forEach((v) {
          _datalist.add(v);
        });
        print('${response.status}');
        if (response.data!.list!.isEmpty) {
          //event.controller.loadComplete();
          CustomToast.show('you have no saved medicals');
        } else {
          //event.controller.loadComplete();
        }
      } else {
        String message = 'your session token has expired. please login again';
        if (response.errMessage != null) {
          message = response.errMessage!;
        } else {
          message = response.message!;
        }
        await _showMyDialog(event.context, response.errMessage!);
      }
      yield state.copyWith(
          datalist: _datalist,
          //controller: event.controller,
          context: event.context);
    }
  }

  Future<void> _showMyDialog(context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                StorageHelper.clear();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LauncherScreen, (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
