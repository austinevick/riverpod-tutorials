import 'package:flutter/material.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:pandamedical/widgets/button.dart';
import 'package:pinput/pinput.dart';

class ChangePasscodeView extends StatelessWidget {
  ChangePasscodeView({Key? key}) : super(key: key);

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              text: 'Change Passcode',
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
            Positioned(
                top: 15.0,
                left: 0.0,
                right: 0.0,
                child: Column(children: [
                  const Image(
                      height: 80,
                      width: 100,
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/padlock.png')),
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
                            const SizedBox(height: 20),
                            CustomText(
                                text: 'Current Passcode*',
                                color: AppColors.blue,
                                bold: true),
                            const SizedBox(height: 10),
                            Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 45,
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Pinput(
                                  length: 4,
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomText(
                                text: 'New Passcode*',
                                color: AppColors.blue,
                                bold: true),
                            const SizedBox(height: 10),
                            Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 45,
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Pinput(
                                  length: 4,
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomText(
                                text: 'Current Passcode*',
                                color: AppColors.blue,
                                bold: true),
                            const SizedBox(height: 10),
                            Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 45,
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Pinput(
                                  length: 4,
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                ),
                              ),
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
