import 'package:flutter/material.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/button.dart';
import 'package:pandamedical/widgets/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandamedical/constants/routing_constants.dart';
import 'package:pinput/pinput.dart';

class SetPinScreen extends StatelessWidget {
  SetPinScreen({Key? key}) : super(key: key);

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
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Set Pin', color: AppColors.blue, bold: true),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          key: const Key('goBack'),
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(FontAwesomeIcons.arrowLeft, color: AppColors.blue),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: statusBarHeight, horizontal: 15),
        child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                CustomText(
                    text: 'Please create a 4 digit pin',
                    color: AppColors.blue,
                    bold: true),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 50,
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('images/padlock.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(20.0),
                  child: Pinput(
                    key: const Key('setPin'),
                    length: 4,
                    onSubmitted: (String pin) => _showSnackBar(pin, context),
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    // submittedFieldDecoration: _pinPutDecoration.copyWith(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    // textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900,),
                    // selectedFieldDecoration: _pinPutDecoration,
                    // followingFieldDecoration: _pinPutDecoration.copyWith(
                    //   borderRadius: BorderRadius.circular(5.0),
                    //   border: Border.all(
                    //     width: 2,
                    //     color: Colors.green.withOpacity(.5),
                    //   ),
                    // ),
                  ),
                ),
                const SizedBox(height: 60),
                CustomButton(
                    key: const Key('setPinBtn'),
                    label: 'CONTINUE',
                    onPress: () {
                      Navigator.pushNamed(context, DashboardViewRoute);
                    }),
                const SizedBox(height: 20.0),
              ],
            )),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: SizedBox(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
