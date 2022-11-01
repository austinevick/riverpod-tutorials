import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facilities_event.dart';
part 'facilities_state.dart';

class FacilitiesBloc extends Bloc<FacilitiesEvent, FacilitiesState> {
  FacilitiesBloc(super.initialState);

  @override
  void onTransition(Transition<FacilitiesEvent, FacilitiesState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Stream<FacilitiesState> mapEventToState(FacilitiesEvent event) async* {
    if (event is InitFacilities) {
      yield state.copyWith(
        facilitiesVerified: false,
        facilities: 'true',
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
