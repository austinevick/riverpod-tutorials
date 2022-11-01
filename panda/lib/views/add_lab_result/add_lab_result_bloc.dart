import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandamedical/helpers/storage/storage.helper.dart';
import 'package:pandamedical/helpers/storage/storage.keys.dart';
import 'package:pandamedical/models/add_lab_result_response.dart';
import 'package:pandamedical/models/vital_options_response.dart';
import 'package:pandamedical/repositories/lab_results_repository.dart';
import 'package:pandamedical/widgets/toasts.dart';
import 'package:pandamedical/widgets/vital_lab.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

part 'add_lab_result_event.dart';
part 'add_lab_result_state.dart';

class AddLabResultBloc extends Bloc<AddLabResultEvent, AddLabResultState> {
  AddLabResultBloc(super.initialState);

  @override
  void onTransition(
      Transition<AddLabResultEvent, AddLabResultState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  LabResultRepository repository = LabResultRepository();

  Stream<AddLabResultState> mapEventToState(AddLabResultEvent event) async* {
    if (event is InitAddLabResult) {
      List<VitalLabWidget> vitalList = []..add(VitalLabWidget(
          data: [],
          hideClose: true,
          position: 0,
          visible: true,
          onPressed: () {
            add(const RemoveVital('0'));
          }));

      Map<String, String> values = {};
      Map<String, String> vitalNames = {};
      //print('event.vitalOptions ${event.vitalOptions}');
      yield state.copyWith(
          values: values, vitalNames: vitalNames, vitalList: vitalList);

      var oresponse = await repository.labResults();
      print('option: ${oresponse.data}');

      vitalList = [
        VitalLabWidget(
            data: oresponse.data,
            hideClose: true,
            position: 0,
            visible: true,
            onPressed: () {
              add(const RemoveVital('0'));
            })
      ];

      yield state.copyWith(
          values: values,
          vitalNames: vitalNames,
          vitalList: vitalList,
          vitalOptions: oresponse.data!);
    } else if (event is AddLabResult) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      List<VitalLabWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add( VitalLabWidget(value: _vitalList[i].value, visible:true,
      //   selected: _vitalList[i].selected, hideClose: _vitalList[i].hideClose,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }
      final index = vitalList.length;
      vitalList.add(VitalLabWidget(
          data: state.vitalOptions!, value: 0, visible: true, position: index));
      print(index);

      yield state.copyWith(
        vitalList: vitalList,
        vitalOptions: vitalOptions,
        values: values,
        vitalNames: vitalNames,
      );
    } else if (event is RemoveVital) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      vitalList.removeWhere((item) {
        int end = event.index.indexOf('-');
        String position = event.index.substring(0, end);
        return item.position == int.parse(position);
      });
      values[event.index] = '0.0';
      vitalNames[event.index] = '';

      print(event.index);

      yield state.copyWith(
        vitalList: vitalList,
        vitalOptions: vitalOptions,
        values: values,
        vitalNames: vitalNames,
      );
    } else if (event is UpdateVitalSelected) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);

      print('_vitalNames[${event.index}] = ${event.value};');
      vitalNames[event.index] = event.value;
      print('_vitalNames: $vitalNames');

      yield state.copyWith(
          date: state.date,
          vitalList: vitalList,
          vitalOptions: vitalOptions,
          values: values,
          vitalNames: vitalNames);
    } else if (event is UpdateVitalValue) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      values[event.index] = event.value;
      print('UpdateVitalValue ;  _values[${event.index}] = ${event.value};');
      values[event.index] = event.value;
      print('_values: \$ $values');

      yield state.copyWith(
          date: state.date,
          vitalList: vitalList,
          vitalOptions: vitalOptions,
          values: values,
          vitalNames: vitalNames);
    } else if (event is SetDate) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      List<VitalLabWidget> list = [];
      print('SET DATE: _vitalNames: $vitalNames');
      print('_values: $values');
      yield state.copyWith(
        date: event.date,
        vitalList: vitalList,
        vitalOptions: vitalOptions,
        values: values,
        vitalNames: vitalNames,
      );
    } else if (event is SetTime) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      print('SET TIME: _vitalNames: $vitalNames');
      print('_values: $values');
      yield state.copyWith(
        time: event.time,
        vitalList: vitalList,
        vitalOptions: vitalOptions,
        values: values,
        vitalNames: vitalNames,
      );
    } else if (event is Submit) {
      List<VitalLabWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      String? userId = await StorageHelper.get(StorageKeys.id);
      print('SUBMIT: _vitalNames: $vitalNames');
      print('_values: $values');

      var pr = ProgressDialog(event.context, isDismissible: false);
      pr.style(
        message: 'proccessing... ',
        borderRadius: 10,
        progressWidget: Container(
          width: 20,
          height: 20,
          padding: const EdgeInsets.all(15),
          child: const CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        elevation: 10,
      );

      if (event.comment == null) {
        CustomToast.show('please enter a comment');
      } else if (event.comment.isEmpty) {
        CustomToast.show('please enter a comment');
      } else if (event.timestamp == null) {
        CustomToast.show('please select a time');
      } else if (event.timestamp.isEmpty) {
        CustomToast.show('please select a time');
      } else if (event.date_entered == null) {
        CustomToast.show('please select a date'); //
      } else if (event.date_entered.isEmpty) {
        CustomToast.show('Please select a date.');
      } else if (event.observedBy.isEmpty) {
        CustomToast.show('Please enter the observer\'s name');
      } else {
        yield state.copyWith(
          loading: true,
          context: event.context,
          vitalList: vitalList,
          vitalOptions: vitalOptions,
          values: values,
          vitalNames: vitalNames,
        );
        await pr.show();

        List<dynamic> vital = [];
        print('_vitalList: $vitalNames');
        print('_values: $values');
        print('_options $vitalOptions');

        //print('e.value= ${e.getValue} ${e.getSelect}');

        vitalOptions.forEach((option) {
          //print(option.title);
          for (final name in vitalNames.keys) {
            if (vitalNames[name] != '') {
              //print(name);
              if (option.title == vitalNames[name]) {
                var obj = {};
                obj['lab_secondary_value'] = '${values[name]}';
                obj['lab_key'] = '${option.key}';
                obj['lab_default_value'] =
                    values[name] == null ? 0 : double.parse('${values[name]}');
                obj['unit'] = ' ';
                obj['description'] = '${option.description}';
                obj['lab_name'] = '${option.title}';
                vital..add(obj);
              }
            }
          }
        });

        var resBody = {};
        resBody['lab_tests'] = vital;
        resBody['comment'] = event.comment;
        resBody['user_id'] = userId;
        resBody['date_entered'] = event.date_entered;
        resBody['timestamp'] = event.timestamp;
        resBody['source'] = 'patient generated';
        resBody['observer_id'] = userId;
        resBody['created_by'] = event.observedBy;
        var req = json.encode(resBody);
        print(req);

        AddLabResultResponse response = await repository.addLabResults(resBody);
        await pr.hide();
        yield state.copyWith(
          loading: false,
          vitalList: vitalList,
          vitalOptions: vitalOptions,
          values: values,
          vitalNames: vitalNames,
        );
        if (response.status == 200) {
          CustomToast.show('${response.message} ${response.status}');
          Navigator.pop(event.context);
          //await Navigator.of(event.context).pushNamedAndRemoveUntil(DashboardViewRoute, (Route<dynamic> route) => false);
          //popUntil(ModalRoute.withName(DashboardViewRoute));
        } else {
          CustomToast.show('${response.status}');
          await _showMyDialog(state.context, response.errMessage);
        }
      }
    }
  }

  Future<void> _showMyDialog(context, dynamic message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$message'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
