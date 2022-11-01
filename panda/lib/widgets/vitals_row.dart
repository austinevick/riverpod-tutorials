import 'package:flutter/material.dart';
import 'package:pandamedical/Styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';

class VitalRow extends StatelessWidget {
  final String? name, value, unit, date, icon;

  VitalRow({Key? key, this.name, this.value, this.icon, this.unit, this.date})
      : super(key: key);
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
                  height: 30, color: Colors.orange, image: AssetImage(icon!)),
              title: Row(children: [
                CustomText(
                  text: '$value$unit',
                  color: AppColors.blue,
                  bold: true,
                ),
                const Spacer(),
                CustomText(
                  text: '--Records',
                  color: AppColors.blue,
                  bold: true,
                )
              ]),
              subtitle: Row(children: [
                CustomText(
                    text: name,
                    color: Colors.black,
                    bold: true,
                    extraSmall: true),
                const Spacer(),
                CustomText(
                    text: 'last recorded on $date',
                    color: Colors.grey,
                    bold: true,
                    extraSmall: true)
              ])),
        ));
  }
}
