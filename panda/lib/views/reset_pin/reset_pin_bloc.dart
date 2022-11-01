import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_pin_event.dart';
part 'reset_pin_state.dart';

class ResetPinBloc extends Bloc<ResetPinEvent, ResetPinState> {
  ResetPinBloc(super.initialState);

  @override
  void onTransition(Transition<ResetPinEvent, ResetPinState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<ResetPinState> mapEventToState(ResetPinEvent event) async* {
    if (event is InitResetPin) {
      yield state.copyWith(
        resetPinVerified: false,
        resetPin: 'true',
      );
    } else if (event is Submit) {
      yield state.copyWith();
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
