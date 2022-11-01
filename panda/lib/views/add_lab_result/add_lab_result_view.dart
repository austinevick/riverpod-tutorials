import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:pandamedical/widgets/button.dart';
import 'package:pandamedical/widgets/form_field.dart';
import 'package:pandamedical/views/add_lab_result/add_lab_result_bloc.dart';

class AddLabResultView extends StatefulWidget {
  const AddLabResultView({Key? key}) : super(key: key);
  @override
  _AddLabResultViewState createState() => _AddLabResultViewState();
}

class _AddLabResultViewState extends State<AddLabResultView> {
  late DateTime initialDate;
  final _key = GlobalKey<FormState>();
  late AddLabResultBloc _bloc;
  String? comment, source, timestamp, dateEntered, observedBy;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AddLabResultBloc>(context);
    _bloc.add(const InitAddLabResult());
  }

  @override
  void dispose() {
    _bloc.add(const InitAddLabResult());
    super.dispose();
  }

  Future<DateTime> showPicker(context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      height: 220,
      context: context,
      customWeekDays: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
      theme: ThemeData(
        primaryColor: Colors.green[400],
        dialogBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.green[200]),
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );
    return newDateTime!;
  }

  void _setDate(context) async {
    DateTime time = await showPicker(context);
    dateEntered = '${time.toLocal()}';
    print(dateEntered);
    _bloc.add(SetDate(time));
  }

  void _setTime(context) async {
    final timePicked = await showRoundedTimePicker(
      context: context,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 49, 216, 57),
        dialogBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.green[200]),
      ),
      initialTime: TimeOfDay.now(),
    );
    timestamp = formatTOD(timePicked!);
    print(formatTOD(timePicked));
    _bloc.add(SetTime(timePicked));
  }

  String formatTOD(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    initialDate = DateTime(1990);

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              text: 'Add Lab Results(s)',
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
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: <Widget>[
            Container(
              height: screenHeight,
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
            Container(
              margin: const EdgeInsets.only(
                top: 100,
                left: 100,
              ),
              height: screenHeight,
            ),
            Positioned(
                top: 15.0,
                left: 0.0,
                right: 0.0,
                child: SizedBox(
                    height: screenHeight,
                    child: ListView(
                        //shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                        controller: ScrollController(),
                        children: [
                          const Image(
                              height: 40,
                              width: 100,
                              fit: BoxFit.fitHeight,
                              image: AssetImage('images/beat.png')),
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            //elevation: 45,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 30),
                                child: Column(
                                  children: <Widget>[
                                    BlocBuilder<AddLabResultBloc,
                                            AddLabResultState>(
                                        buildWhen: (previous, current) =>
                                            previous.vitalList !=
                                            current.vitalList,
                                        builder: (context, state) {
                                          if (state.vitalList == null) {
                                            return Container();
                                          } else {
                                            return Column(
                                              children: state
                                                  .vitalList!, //.map((e){ return e;}).toList(),
                                            );
                                          }
                                        }),
                                    const SizedBox(height: 20),
                                    Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: AppColors.green,
                                                width: 1.0)),
                                        elevation: 2,
                                        child: IconButton(
                                            onPressed: () {
                                              _bloc.add(AddLabResult());
                                            },
                                            icon: Icon(Icons.add,
                                                color: AppColors.green,
                                                size: 25))),
                                    const SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                          text: 'Date',
                                          color: AppColors.blue,
                                          bold: true),
                                    ),
                                    const SizedBox(height: 10),
                                    BlocBuilder<AddLabResultBloc,
                                        AddLabResultState>(
                                      buildWhen: (previous, current) =>
                                          previous.date != current.date,
                                      builder: (context, state) {
                                        return GestureDetector(
                                            onTap: () {
                                              _setDate(context);
                                            },
                                            child: Container(
                                              height: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.greenBG,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColors.green),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: Row(
                                                children: <Widget>[
                                                  CustomText(
                                                      text: state.date != null
                                                          ? '${state.date!.day}/${state.date!.month}/${state.date!.year}'
                                                          : 'Date',
                                                      color: AppColors.blue,
                                                      bold: true),
                                                  const Spacer(),
                                                  Icon(
                                                    FontAwesomeIcons.calendar,
                                                    color: AppColors.green,
                                                    size: 25,
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                          text: 'Time',
                                          color: AppColors.blue,
                                          bold: true),
                                    ),
                                    const SizedBox(height: 10),
                                    BlocBuilder<AddLabResultBloc,
                                        AddLabResultState>(
                                      buildWhen: (previous, current) =>
                                          previous.time != current.time,
                                      builder: (context, state) {
                                        return GestureDetector(
                                            onTap: () {
                                              _setTime(context);
                                            },
                                            child: Container(
                                              height: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.greenBG,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColors.green),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: Row(
                                                children: <Widget>[
                                                  CustomText(
                                                      text: state.time != null
                                                          ? state.time!
                                                              .format(context)
                                                          : 'Set Time',
                                                      color: AppColors.blue,
                                                      bold: true),
                                                  const Spacer(),
                                                  //Icon(FontAwesomeIcons.watch, color: AppColors.green, size: 25,)
                                                ],
                                              ),
                                            ));
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                          text: 'Observed by',
                                          color: AppColors.blue,
                                          bold: true),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.greenBG,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: CustomFormField(
                                        keyboardType: TextInputType.text,
                                        compulsory: true,
                                        onChange: (value) {
                                          observedBy = value;
                                          print(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomText(
                                          text: 'Comment',
                                          color: AppColors.blue,
                                          bold: true),
                                    ),
                                    const SizedBox(height: 10),
                                    Form(
                                        key: _key,
                                        child: Column(children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.greenBG,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15))),
                                            child: CustomFormField(
                                              keyboardType: TextInputType.text,
                                              minLines: 4,
                                              compulsory: true,
                                              multiline: true,
                                              onChange: (value) {
                                                comment = value;
                                                print(value);
                                              },
                                            ),
                                          ),
                                        ])),
                                    const SizedBox(height: 20),
                                    CustomButton(
                                        label: 'SUBMIT',
                                        key: const Key('submit'),
                                        onPress: () {
                                          if (_key.currentState!.validate()) {
                                            _bloc.add(Submit(
                                                comment!,
                                                dateEntered!,
                                                timestamp!,
                                                context,
                                                observedBy!));
                                            //Navigator.pushNamed(context, OtpViewRoute);
                                          }
                                        }),
                                    const SizedBox(height: 70),
                                  ],
                                )),
                          )
                        ]))),
          ])
        ])));
  }
}
