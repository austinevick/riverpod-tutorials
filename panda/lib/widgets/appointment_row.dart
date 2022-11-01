import 'package:flutter/material.dart';
import 'package:pandamedical/Styles/app_colors.dart';
import 'package:pandamedical/models/appointments_response.dart';
import 'package:pandamedical/widgets/text.dart';

//datasSecondaryValue; sId; datasKey;  datasDefaultValue; unit;  description; title;
class AppointmentRow extends StatelessWidget {
  final Appointments? data;

  const AppointmentRow({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: ListTile(
            leading: Image(
                height: 30,
                color: Colors.orange,
                image: AssetImage(icon(data!.appointee!.profilePic!))),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                text:
                    '${data!.appointee!.firstName} ${data!.appointee!.lastName}',
                color: AppColors.blue,
                bold: true,
              ),
              CustomText(
                text: data!.appointee!.role,
                color: AppColors.blue,
                small: true,
              ),
              const SizedBox(
                height: 10,
              )
            ]),
            subtitle: Row(children: [
              CustomText(
                  text:
                      'on ${data!.timeslots!.slotDate != null ? data!.timeslots!.slotDate!.substring(0, 9) : ''} at ${data!.timeslots!.slotTime}:00',
                  color: Colors.grey,
                  bold: true,
                  extraSmall: true),
              const Spacer(),
              CustomText(
                  text: data!.timeslots!.status,
                  color: AppColors.green1,
                  bold: true,
                  small: true),
            ]),
            //onTap: ()=> Navigator.pushNamed(context, VitalDetailViewRoute, arguments: data),
          ),
        ));
  }

  String icon(String title) {
    switch (title) {
      case 'images/heart.png':
        return 'images/heart.png';
      default:
        return 'images/heart.png';
    }
  }
}
