import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandamedical/helpers/storage/storage.helper.dart';
import 'package:pandamedical/helpers/storage/storage.keys.dart';
import 'package:pandamedical/models/vital_options_response.dart';
import 'package:pandamedical/models/add_vital_response.dart';
import 'package:pandamedical/widgets/toasts.dart';
import 'package:pandamedical/repositories/vitals_repository.dart';
import 'package:pandamedical/widgets/vital.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

part 'add_vital_event.dart';
part 'add_vital_state.dart';

class AddVitalBloc extends Bloc<AddVitalEvent, AddVitalState> {
  AddVitalBloc(super.initialState);

  @override
  void onTransition(Transition<AddVitalEvent, AddVitalState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  final VitalRepository _repository = VitalRepository();

  Stream<AddVitalState> mapEventToState(AddVitalEvent event) async* {
    if (event is InitAddVital) {
      List<VitalWidget> vitalList = []..add(VitalWidget(
          data: [],
          hideClose: true,
          position: 0,
          visible: true,
          onPressed: () {
            add(const RemoveVital('0'));
          }));

      Map<String, String> values = {};
      Map<String, String> vitalNames = {};
      print('event.vitalOptions ${event.vitalOptions}');
      yield state.copyWith(
          values: values, vitalNames: vitalNames, vitalList: vitalList);

      var oresponse = await _repository.vitals();
      print('option: ${oresponse.data}');

      vitalList = []..add(VitalWidget(
          data: oresponse.data,
          hideClose: true,
          position: 0,
          visible: true,
          onPressed: () {
            add(const RemoveVital('0'));
          }));

      print('event.vitalOptions ${event.vitalOptions}');
      yield state.copyWith(
          values: values,
          vitalNames: vitalNames,
          vitalList: vitalList,
          vitalOptions: oresponse.data!);
    } else if (event is AddVital) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      List<VitalWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add( VitalWidget(value: _vitalList[i].value, visible:true,
      //   selected: _vitalList[i].selected, hideClose: _vitalList[i].hideClose,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }
      final index = vitalList.length;
      vitalList.add(VitalWidget(
          data: state.vitalOptions!, value: 0, visible: true, position: index));
      print(index);

      yield state.copyWith(
        vitalList: vitalList,
        vitalOptions: vitalOptions,
        values: values,
        vitalNames: vitalNames,
      );
    } else if (event is RemoveVital) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
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
      List<VitalWidget> vitalList = List.from(state.vitalList!);
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
      List<VitalWidget> vitalList = List.from(state.vitalList!);
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
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      List<VitalWidget> list = [];
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
      List<VitalWidget> vitalList = List.from(state.vitalList!);
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
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<VitalData> vitalOptions = List.from(state.vitalOptions!);
      Map<String, String> values = Map.from(state.values!);
      Map<String, String> vitalNames = Map.from(state.vitalNames!);
      String? userId = await StorageHelper.get(StorageKeys.id);
      print('SUBMIT: _vitalNames: $vitalNames');
      print('_values: $values');

      var pr = ProgressDialog(event.context, isDismissible: false);
      pr.style(
        message: 'processing... ',
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
        CustomToast.show('please select a date');
      } else if (event.date_entered.isEmpty) {
        CustomToast.show('Please select a date.');
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
          print(option.title);
          for (final name in vitalNames.keys) {
            if (vitalNames[name] != '') {
              if (option.title == vitalNames[name]) {
                var obj = {};
                obj['vitals_secondary_value'] = '${values[name]}';
                obj['vitals_key'] = option.key;
                obj['vitals_default_value'] =
                    values[name] == null ? 0 : double.parse('${values[name]}');
                obj['unit'] = option.getUnit.symbol;
                obj['description'] = option.description;
                obj['title'] = option.title;
                vital.add(obj);
              }
            }
          }
        });

        var resBody = {};
        resBody['vitals'] = vital;
        resBody['comment'] = event.comment;
        resBody['user_id'] = userId;
        resBody['date_entered'] = event.date_entered;
        resBody['timestamp'] = event.timestamp;
        resBody['source'] = 'patient generated';
        resBody['observer_id'] = userId;
        resBody['created_by'] = 'Ozichukwu Ezike';
        var req = json.encode(resBody);
        print(req);

        AddVitalResponse response = await _repository.addVitals(resBody);
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
