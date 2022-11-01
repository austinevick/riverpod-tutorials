import 'package:flutter/material.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pandamedical/models/physician_response.dart';
import 'package:pandamedical/widgets/text.dart';

class TimeSlot extends StatelessWidget {
  final String? title;
  final List<String>? slots;
  final Physicians? data;
  final String? date;
  const TimeSlot({
    Key? key,
    this.title,
    this.slots,
    this.data,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(children: [
          Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(color: Colors.grey, width: 0.3)),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: GridView(
                    shrinkWrap: true, padding: EdgeInsets.zero,
                    controller: ScrollController(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            childAspectRatio:
                                1.6), //mainAxisSpacing: 0, crossAxisSpacing: 0
                    children: slots!.map((slot) {
                      return GestureDetector(
                        child: Row(children: [
                          CustomText(
                              text: slot,
                              color: Colors.black,
                              bold: true,
                              small: true),
                          const SizedBox(width: 15)
                        ]),
                        onTap: () {
                          var args = {};
                          args['date'] = date;
                          args['data'] = data;
                          args['time'] = slot.replaceAll(':00', '');
                          Navigator.pushNamed(context, ConfirmBookingViewRoute,
                              arguments: args);
                          //Navigator.pushNamed(context, MyEnumerationsRoute, arguments: menu.name);
                        },
                      );
                    }).toList(),
                  ))),
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.amberAccent,
                      Colors.amberAccent,
                      Colors.pinkAccent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white12,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 7.5,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Material(
                  color: Colors.transparent, // height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                        child: CustomText(
                            text: '$title',
                            color: Colors.black,
                            bold: true,
                            extraSmall: true)),
                  )),
            ),
          )
        ]));
  }
}
