import 'package:lib_msaadev/lib_msaadev.dart';

import 'package:flutter/material.dart';

class StarCard extends StatelessWidget {
  final int index;
  final String text;

  const StarCard({Key? key, required this.index, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/star$index.png'),
        Positioned(
            bottom: 0,
            child: Text(
              text,
              style: context.textTheme.headline6,
            ))
      ],
    );
  }
}
