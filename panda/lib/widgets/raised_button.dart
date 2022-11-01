import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const RaisedGradientButton({
    Key? key,
    @required this.child,
    this.gradient,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width ?? 370,
          height: height ?? 50.0,
          decoration: BoxDecoration(
              gradient: gradient,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white12,
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                key: key,
                onTap: onPressed,
                child: Center(
                  child: child,
                )),
          ),
        ));
  }
}
