import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leading/app/utils/consts.dart';

enum ButtonType { succes, error, loading }

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.type,
    this.succes,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final ButtonType type;
  final String? succes;
  final Color? color;

  Widget _child(BuildContext context) {
    if (type == ButtonType.error)
      return Text(
        'Retry',
        style: Theme.of(context).textTheme.button,
      );

    if (type == ButtonType.succes)
      return Text(
        succes ?? 'Continue',
        style: Theme.of(context).textTheme.button,
      );

    return SpinKitWave(
      color: Theme.of(context).backgroundColor,
      size: 30,
    );
  }

  Color _color(BuildContext context) {
    if (color != null) return color!;
    if (type == ButtonType.error) return Theme.of(context).errorColor;
    return Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed ?? () {},
      color: _color(context),
      minWidth: 200,
      height: 54,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      child: Center(
          child: AnimatedSwitcher(
        duration: Kduration.short,
        child: _child(context),
      )),
    );
  }
}
