import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pandamedical/Styles/app_colors.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/models/physician_response.dart';
import 'package:pandamedical/widgets/small_button.dart';
import 'package:pandamedical/widgets/text.dart';

class DoctorRow extends StatelessWidget {
  final Physicians? data;
  const DoctorRow({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 1,
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(height: 5),
                      Image(height: 70, image: AssetImage('images/pic1.png')),
                      SizedBox(height: 5),
                      CustomText(
                          text: '36 votes',
                          small: true,
                          color: Colors.grey,
                          bold: true),
                      SizedBox(height: 5),
                      CustomText(
                          text: '95 Feedbacks',
                          small: true,
                          color: Colors.black,
                          bold: true),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                              text:
                                  '${data!.userInfo!.firstName} ${data!.userInfo!.lastName}',
                              small: true,
                              color: AppColors.blue,
                              bold: true),
                          const SizedBox(width: 10),
                          RatingBarIndicator(
                              rating: 3.5,
                              itemBuilder: (context, index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              itemCount: 1,
                              itemSize: 20.0,
                              direction: Axis.horizontal),
                          const CustomText(
                              text: '4.3',
                              small: true,
                              color: Colors.grey,
                              bold: true),
                          const SizedBox(width: 30),
                        ],
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                  color: Colors.grey, width: 0.2)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            text:
                                                '${data!.titles} - ${data!.specialty!.field}',
                                            extraSmall: true,
                                            color: Colors.grey,
                                            bold:
                                                true), //'MBBS,DOMS,MS - Ophthalmology'
                                        const SizedBox(width: 30)
                                      ],
                                    ),
                                    CustomText(
                                        text: '${data?.specialty!.title}',
                                        extraSmall: true,
                                        color: Colors.grey,
                                        bold: true),
                                    const CustomText(
                                        text: '26 years of experience',
                                        extraSmall: true,
                                        color: Colors.grey,
                                        bold: true),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            const Image(
                                height: 12,
                                image: AssetImage('images/doctor.png')),
                            const SizedBox(width: 5),
                            const CustomText(
                                text: 'Doctor',
                                extraSmall: true,
                                color: Colors.grey,
                                bold: true),
                            const SizedBox(width: 30),
                            const Image(
                                height: 12,
                                image: AssetImage('images/placeholder.png')),
                            const SizedBox(width: 5),
                            CustomText(
                                text: data!.userInfo!.city,
                                extraSmall: true,
                                color: Colors.grey,
                                bold: true),
                          ])
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: CustomText(
                            text: '  LASIK Eye...  ',
                            color: AppColors.blue,
                            extraSmall: true,
                            bold: true)),
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: CustomText(
                              text: '  Anterior seg...  ',
                              color: AppColors.blue,
                              extraSmall: true,
                              bold: true))),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: CustomText(
                              text: '  +2 more  ',
                              color: AppColors.blue,
                              extraSmall: true,
                              bold: true)))
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: CustomSmallButton(
                label: 'Get Appointment',
                width: 170,
                onPress: () {
                  Navigator.pushNamed(context, SelectSlotViewRoute,
                      arguments: data);
                },
              ))
            ],
          )),
    );
  }
}
