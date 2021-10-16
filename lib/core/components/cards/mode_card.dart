import 'package:flutter/material.dart';
import 'package:pedal_commander/view/home/model/pedal_mode.dart';
import 'package:lib_msaadev/lib_msaadev.dart';

class ModeCard extends StatelessWidget {
  final PedalMode mode;
  final Function()? onPressed;

  const ModeCard({Key? key, required this.mode, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.paddingAll,
      padding: 10.paddingAll,
      decoration: BoxDecoration(
        color: mode.color,
        borderRadius: 20.customRadius,
      ),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fast.png',
            ),
            Text(
              mode.label,
              style: context.textTheme.bodyText1!.copyWith(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    ).onTap(onPressed);
  }
}
