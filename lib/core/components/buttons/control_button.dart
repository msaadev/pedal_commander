import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';

class ControlButton extends StatelessWidget {
  final String type;
  final Function()? onPressed;

  const ControlButton({Key? key, required this.type, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: 18.customRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                  spreadRadius: 2,
                )
              ],
            ),
            child: Image.asset('assets/images/$type.png'))
        .onTap(onPressed);
  }
}
