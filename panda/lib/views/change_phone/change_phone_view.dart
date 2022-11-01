import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:pandamedical/widgets/button.dart';
import 'package:pandamedical/widgets/form_field.dart';
import 'package:pandamedical/views/change_phone/change_phone_bloc.dart';

class ChangePhoneView extends StatefulWidget {
  const ChangePhoneView({Key? key}) : super(key: key);

  @override
  State<ChangePhoneView> createState() => _ChangePhoneViewState();
}

class _ChangePhoneViewState extends State<ChangePhoneView> {
  final TextEditingController controller = TextEditingController();

  var initialCountry = 'NG';

  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<ChangePhoneBloc>(context);
    _bloc.add(InitChangePhone());

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              text: 'Change Phone Number',
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
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.greenBG,
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(45.0)),
                ),
              ),
            ]),
            Positioned(
                top: 15.0,
                left: 0.0,
                right: 0.0,
                child: Column(children: [
                  const Image(
                      height: 80,
                      width: 100,
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/phone.png')),
                  const SizedBox(height: 10),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 45,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // BlocBuilder<ChangePhoneBloc, ChangePhoneState>(
                            // condition: (previous, current) => previous.vitalList != current.vitalList,
                            // builder: (context, state) {
                            //   if(state.vitalList == null){
                            //     return Container();
                            //   }else{ return Column(
                            //     children: state.vitalList,//.map((e){ return e;}).toList(),
                            //   );}
                            // }),
                            const SizedBox(height: 20),
                            Card(
                              shadowColor: AppColors.grey1,
                              elevation: 14,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                  height: 84,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: AppColors.green),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: BlocBuilder<ChangePhoneBloc,
                                          ChangePhoneState>(
                                      buildWhen: (previous, current) =>
                                          previous.phoneVerified !=
                                          current.phoneVerified,
                                      builder: (context, state) {
                                        if (state.phoneVerified == null) {
                                          return Container();
                                        } else {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 9,
                                                  child:
                                                      InternationalPhoneNumberInput(
                                                    key: const Key('phone'),
                                                    onInputChanged:
                                                        (PhoneNumber number) {
                                                      _bloc.add(ValidateNumber(
                                                          number.phoneNumber!));
                                                      // //print(number.phoneNumber);
                                                      // if( _key.currentState.validate()){

                                                      // }
                                                    },
                                                    onInputValidated:
                                                        (bool value) {
                                                      // print(value);
                                                    },
                                                    selectorConfig:
                                                        const SelectorConfig(
                                                      selectorType:
                                                          PhoneInputSelectorType
                                                              .BOTTOM_SHEET,
                                                      //  backgroundColor: Colors.black,
                                                    ),
                                                    formatInput: false,
                                                    ignoreBlank: false,
                                                    maxLength: 15,
                                                    //autoValidate: AutovalidateMode.disabled,

                                                    //autoValidate: true,
                                                    selectorTextStyle:
                                                        const TextStyle(
                                                            color:
                                                                Colors.black),
                                                    initialValue: number,
                                                    textFieldController:
                                                        controller,
                                                    inputBorder:
                                                        InputBorder.none,
                                                  )),
                                              Expanded(
                                                flex: 1,
                                                child: state.phoneVerified ==
                                                        true
                                                    ? Icon(
                                                        FontAwesomeIcons
                                                            .checkCircle,
                                                        size: 20,
                                                        color:
                                                            AppColors.primary,
                                                      )
                                                    : const Icon(
                                                        Icons.cancel,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                              ),
                                            ],
                                          );
                                        }
                                      })),
                            ),
                            const SizedBox(height: 5.0),
                            Center(
                              child: CustomText(
                                  text:
                                      'Verification code would be sent to this number',
                                  color: AppColors.blue,
                                  extraSmall: true,
                                  bold: true),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                                label: 'UPDATE',
                                key: const Key('submit'),
                                onPress: () {
                                  // _bloc.add(CheckForm(true));
                                  // if( _key.currentState.validate()){
                                  //     Navigator.pushNamed(context, OtpViewRoute);
                                  //   }
                                }),
                          ],
                        )),
                  )
                ])),
          ])
        ])));
  }
}
