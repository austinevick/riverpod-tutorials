import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandamedical/Styles/app_colors.dart';
import 'package:pandamedical/constants/app_constants.dart';
import 'package:pandamedical/views/vitals/vitals_bloc.dart';
import 'package:pandamedical/widgets/text.dart';

class MyVitalRow extends StatelessWidget {
  final UserVital? data;
  const MyVitalRow({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VitalsBloc>(context);
    var vital = data;

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
                image: AssetImage(vital!.icon!)),
            title: Row(children: [
              CustomText(
                text: '${vital.value} ${vital.unit}',
                color: AppColors.blue,
                bold: true,
              ),
              const Spacer(),
              CustomText(
                text: '${vital.number_of_records} Records',
                color: AppColors.blue,
                bold: true,
              )
            ]),
            subtitle: Row(children: [
              CustomText(
                  text: vital.name,
                  color: Colors.black,
                  bold: true,
                  extraSmall: true),
              const Spacer(),
              CustomText(
                  text: data!.latest_record == ''
                      ? 'last recorded on  ----/--/--'
                      : 'last recorded on ${data!.latest_record!.substring(0, 10)}',
                  color: Colors.grey,
                  bold: true,
                  extraSmall: true)
            ]),
            onTap: () => int.parse(vital.number_of_records!) > 0
                ? bloc.add(ViewVitals(vital.key!, context))
                : null,
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
