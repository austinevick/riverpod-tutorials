import 'package:flutter/material.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:pandamedical/widgets/form_field.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/models/vital_history_response.dart';
import 'package:pandamedical/widgets/vital_item.dart';

class VitalDetailView extends StatelessWidget {
  final List<VitalHistoryData>? data;

  const VitalDetailView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              text: 'Vital Details',
              color: AppColors.blue,
              big: true,
              bold: true),
          backgroundColor: AppColors.greenBG,
          leading: BackButton(
              color: AppColors.blue,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView(children: [
          Stack(children: <Widget>[
            Container(
              height: screenHeight - 60,
              color: Colors.white,
            ),
            Column(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.greenBG,
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(45.0)),
                ),
              ),
            ]),
            //Container(margin: EdgeInsets.only(top: 100, left: 100,), height: 1000,),
            Positioned(
                top: 15.0,
                left: 0.0,
                right: 0.0,
                bottom: 00,
                child: SizedBox(
                  height: 700,
                  child: ListView(
                      //shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                      controller: ScrollController(),
                      children: [
                        const Image(
                            height: 40,
                            width: 100,
                            fit: BoxFit.fitHeight,
                            image: AssetImage('images/beat.png')),
                        const SizedBox(height: 10),
                        Card(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: data!
                                    .map((e) => Column(children: [
                                          Column(
                                              children: e.vitals!.map((test) {
                                            print(test);
                                            return VitalItemWidget(
                                              e: e,
                                              data: test,
                                            );
                                          }).toList()),
                                          const SizedBox(height: 10),
                                        ]))
                                    .toList(),
                              ),
                            )),

                        // SizedBox(height:900)
                      ]),
                )),
          ])
        ]));
  }
}
