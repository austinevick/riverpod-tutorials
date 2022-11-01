import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandamedical/models/medical_specialty_response.dart';
import 'package:pandamedical/repositories/medical_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pandamedical/widgets/toasts.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/helpers/storage/storage.helper.dart';
part 'doctors_event.dart';
part 'doctors_state.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  DoctorsBloc(super.initialState);

  @override
  void onTransition(Transition<DoctorsEvent, DoctorsState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<DoctorsState> mapEventToState(DoctorsEvent event) async* {
    var repository = MedicalRepository();

    if (event is InitDoctors) {
      yield state.copyWith(
        datalist: [],
      );
    } else if (event is GetSpecialty) {
      //event.controller.loadData();
      //if failed,use loadFailed(),if no data return,use LoadNodata(), refreshCompleted, refreshFailed
      List<Listt> datalist = [];
      var response = await repository.getSpecialty();
      if (response.status == 200) {
        response.data!.list!.forEach((v) {
          datalist.add(v);
        });
        print('${response.status}');
        if (response.data!.list!.isEmpty) {
          event.controller.loadComplete();
          CustomToast.show('failed to fetch specialty');
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
          datalist: datalist,
          controller: event.controller,
          context: event.context);
    } else if (event is RefreshSpecialty) {
      var datalist = <Listt>[];
      var response = await repository.getSpecialty();

      //var oresponse = await _repository.vitals();

      //print('option: ${oresponse.data}');

      if (response.status == 200) {
        response.data!.list!.forEach((v) {
          datalist.add(v);
        });
        state.controller!.refreshCompleted();
      } else {
        state.controller!.loadFailed();
        String message = 'your session token has expired. please login again';
        if (response.errMessage != null) {
          message = response.errMessage!;
        } else {
          message = response.message!;
        }
        await _showMyDialog(state.context, response.errMessage!);
      }
      yield state.copyWith(
        datalist: datalist,
        controller: state.controller,
        //vitalOptions: oresponse.data
      );
    }
  }

  Future<void> _showMyDialog(context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
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
