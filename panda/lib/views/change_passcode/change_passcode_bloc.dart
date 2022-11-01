import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pandamedical/widgets/vital.dart';

part 'change_passcode_event.dart';
part 'change_passcode_state.dart';

class ChangePasscodeBloc
    extends Bloc<ChangePasscodeEvent, ChangePasscodeState> {
  ChangePasscodeBloc(super.initialState);

  @override
  void onTransition(
      Transition<ChangePasscodeEvent, ChangePasscodeState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<ChangePasscodeState> mapEventToState(
      ChangePasscodeEvent event) async* {
    if (event is InitChangePasscode) {
      List<VitalWidget> vitalList = []..add(VitalWidget(
          hideClose: true,
          position: 0,
          onPressed: () {
            this.add(RemoveVital(0));
          }));
      List<double> values = state.values!;
      List<String> vitalNames = state.vitalNames!;
      //_vitalList.add( VitalWidget(onPressed: (){this.add(RemoveVital(1));}));
      yield state.copyWith(
        vitalList: vitalList,
      );
    } else if (event is ChangePasscode) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<double> values = List.from(state.values!);
      List<String> vitalNames = List.from(state.vitalNames!);
      List<VitalWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add( VitalWidget(value: _vitalList[i].value,
      //   selected: _vitalList[i].selected, hideClose: _vitalList[i].hideClose,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }
      //_list..add( VitalWidget(value: 0, onPressed: (){this.add(RemoveVital(_vitalList.length));}));
      print(list);

      yield state.copyWith(
        vitalList: list,
      );
    } else if (event is RemoveVital) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<double> values = List.from(state.values!);
      List<String> vitalNames = List.from(state.vitalNames!);
      vitalList.removeAt(event.index);
      List<VitalWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add(  VitalWidget(value: _vitalList[i].value, hideClose: _vitalList[i].hideClose,
      //   selected: _vitalList[i].selected,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }

      yield state.copyWith(
        vitalList: list,
      );
    } else if (event is SetDate) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<VitalWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add( VitalWidget(value: _vitalList[i].value, hideClose: _vitalList[i].hideClose,
      //   selected: _vitalList[i].selected,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }
      yield state.copyWith(
        date: event.date,
        vitalList: list,
      );
    } else if (event is SetTime) {
      List<VitalWidget> vitalList = List.from(state.vitalList!);
      List<VitalWidget> list = [];
      // for(int i = 0; i < _vitalList.length; i++){
      //   _list..add( VitalWidget(value: _vitalList[i].value, hideClose: _vitalList[i].hideClose,
      //   selected: _vitalList[i].selected,
      //   onPressed: (){this.add(RemoveVital(i));}));
      // }
      yield state.copyWith(
        time: event.time,
        vitalList: list,
      );
    }
  }

// Future<void> _showMyDialog(context, role, String message, String token) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error Message!'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(message),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             message == "Device offline" && token.isNotEmpty ?
//             FlatButton(
//               child: Text('work offline?'),
//               onPressed: () {
//                 //Navigator.of(context).pushReplacementNamed(DashboardViewRoute);

//                   // if(role == 1){
//                   //   Navigator.pushReplacementNamed(context, TargetsViewRoute);
//                   // }else {
//                   //   Navigator.of(context).pushReplacementNamed(DashboardViewRoute);
//                   // }

//               },
//             ) : null,
//           ],
//         );
//       },
//     );
//   }

}
