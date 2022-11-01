import 'package:flutter/material.dart';
import 'package:pandamedical/models/vital_history_response.dart';
import 'package:pandamedical/models/vital_obj.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';

class VitalItemWidget extends StatelessWidget {
  final Vitals? data;
  final VitalHistoryData? e;
  const VitalItemWidget({
    Key? key,
    this.data,
    this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            margin: const EdgeInsets.only(top: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: AppColors.green, width: 1.0)),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Vital:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: data!.title,
                            color: AppColors.blue,
                            bold: true),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Value:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: data!.vitalsDefaultValue,
                            color: AppColors.blue,
                            bold: true),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Unit:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: data!.unit,
                            color: AppColors.blue,
                            bold: true),
                      ),
                    ]))),
        const SizedBox(height: 10),
        Card(
            margin: const EdgeInsets.only(top: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: AppColors.green, width: 1.0)),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Observed by:',
                          color: AppColors.blue,
                          bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: e!.createdBy,
                            color: AppColors.blue,
                            bold: true),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Date:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: e!.dateEntered!.substring(0, 10),
                            color: AppColors.blue,
                            bold: true),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Time:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: e!.timestamp,
                            color: AppColors.blue,
                            bold: true),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: 'Comment:', color: AppColors.blue, bold: true),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.greenBG,
                            border:
                                Border.all(width: 1, color: AppColors.green),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: CustomText(
                            text: e!.comment,
                            color: AppColors.blue,
                            bold: true),
                      ),
                    ])))
      ],
    );
  }
}
