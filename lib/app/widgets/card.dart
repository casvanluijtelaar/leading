import 'package:flutter/material.dart';
import 'package:leading/app/utils/consts.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card',
      child: Container(
        padding: const EdgeInsets.all(Kpadding.large),
        margin: const EdgeInsets.all(Kpadding.large),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                spreadRadius: 20,
                blurRadius: 100,
                offset: Offset(0, 10),
                color: Color.fromRGBO(157, 207, 243, 0.25),
              ),
            ]),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
