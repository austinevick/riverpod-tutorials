import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandamedical/Styles/app_colors.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/models/vital_history_response.dart';
import 'package:pandamedical/models/vital_obj.dart';
import 'package:pandamedical/widgets/text.dart';

//vitalsSecondaryValue; sId; vitalsKey;  vitalsDefaultValue; unit;  description; title;
class VitalHistory extends StatelessWidget {
  final VitalHistoryData? data;
  final Vitals? vital;
  const VitalHistory({
    Key? key,
    this.data,
    this.vital,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 10),
          child: ListTile(
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '${data!.createdBy}',
                      color: AppColors.blue,
                      bold: true,
                      big: true,
                    ),
                    CustomText(
                      text: vital!.title,
                      color: Colors.black54,
                      bold: true,
                    )
                  ]),
              trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: vital!.vitalsDefaultValue,
                      color: AppColors.blue,
                      bold: true,
                      large: true,
                    ),
                    CustomText(
                      text: vital!.unit,
                      color: AppColors.primary,
                      bold: true,
                    ), //SizedBox(height:5),
                  ]),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CustomText(
                        text:
                            'last recorded on ${data!.dateEntered != null ? data!.dateEntered!.substring(0, 9) : ''}   ${data!.timestamp}',
                        color: Colors.grey,
                        bold: true,
                        extraSmall: true)
                  ]),
              onTap: () {
                //   var _data = {};
                // _data['data'] =data;
                // _data['vital'] =vital;
                Navigator.pushNamed(context, VitalDetailViewRoute,
                    arguments:
                        data); //Navigator.pushNamed(context, VitalDetailViewRoute, arguments: data),
              }),
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
