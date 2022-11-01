import 'package:flutter/material.dart';
import 'package:pandamedical/styles/app_colors.dart';
import 'package:pandamedical/widgets/text.dart';

class CustomButton2 extends StatelessWidget {
  final String? label;
  final VoidCallback? onPress;
  final bool? disabled;
  final bool? transparent;
  final Icon? icon;

  //final double _elevation = 3;
  const CustomButton2({
    Key? key,
    this.label,
    this.onPress,
    this.disabled,
    this.transparent,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    var textColor = AppColors.green;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 370,
        child: RaisedButton(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: AppColors.green)),
          onPressed: action,
          elevation: 0,
          color: Colors.white,
          child: icon ??
              CustomText(
                  text: label ?? 'Label',
                  small: false,
                  bold: true,
                  color: textColor),
        ),
      ),
    );
  }
}
