import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: 0,
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
